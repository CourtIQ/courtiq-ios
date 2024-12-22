//
//  Router.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-25.
//

import SwiftUI

// MARK: - RouterAction

enum RouterAction {
    case showScreen(AnyView)
    case showSheet(AnyView)
    case showHalfSheet(AnyView, detents: [CustomDetent])
    case showAlert(Alert)
    case showToast(ToastType)
    case push(AnyView)
    case pop
    case popToRoot
    case setRootView(AnyView)
    case dismiss
    case isLoading
    case stopLoading
}

// MARK: - AppRouter

@MainActor
@available(iOS 16.0, *)
final class AppRouter: ObservableObject {
    @Published var navigationPath: [ViewWrapper] = []
    @Published var currentSheet: ViewWrapper? = nil
    @Published var currentScreenCover: ViewWrapper? = nil
    @Published var currentHalfSheet: ViewWrapper? = nil
    @Published var halfSheetDetents: [PresentationDetent] = []
    @Published var currentAlert: Alert? = nil
    @Published var currentToast: ViewWrapper? = nil
    @Published var isLoading: Bool = false

    func handle(action: RouterAction) {
        switch action {
        case .showScreen(let view):
            currentScreenCover = ViewWrapper(view: view)
        case .showSheet(let view):
            currentSheet = ViewWrapper(view: view)
        case .showHalfSheet(let view, let detents):
            currentHalfSheet = ViewWrapper(view: view)
            halfSheetDetents = detents.map { $0.value }
        case .showAlert(let alert):
            currentAlert = alert
        case .showToast(let type):
            currentToast = ViewWrapper(view: AnyView(ToastView(type: type)))
        case .push(let view):
            navigationPath.append(ViewWrapper(view: view))
        case .pop:
            if !navigationPath.isEmpty {
                navigationPath.removeLast()
            }
        case .popToRoot:
            navigationPath.removeAll()
        case .setRootView(let view):
            navigationPath = [ViewWrapper(view: view)]
        case .dismiss:
            dismiss()
        case .isLoading:
            isLoading = true
        case .stopLoading:
            isLoading = false
        }
    }

    private func dismiss() {
        currentSheet = nil
        currentHalfSheet = nil
        currentAlert = nil
        currentToast = nil
        currentScreenCover = nil
    }
}

// MARK: - CustomDetent

enum CustomDetent {
    case small
    case medium
    case large

    var value: PresentationDetent {
        switch self {
        case .small:
            return .fraction(0.3)
        case .medium:
            return .fraction(0.5)
        case .large:
            return .fraction(0.7)
        }
    }
}

// MARK: - ViewWrapper

struct ViewWrapper: Identifiable, Hashable {
    static func == (lhs: ViewWrapper, rhs: ViewWrapper) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id = UUID()
    let view: AnyView
}

// MARK: - ToastType

enum ToastType {
    case normal(String)
    case error(String)
    case warning(String)
    case success(String)
}

// MARK: - ToastView

struct ToastView: View {
    let type: ToastType

    var body: some View {
        switch type {
        case .normal(let message):
            Text(message)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
        case .error(let message):
            Text(message)
                .padding()
                .background(Color.red)
                .cornerRadius(8)
        case .warning(let message):
            Text(message)
                .padding()
                .background(Color.yellow)
                .cornerRadius(8)
        case .success(let message):
            Text(message)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
    }
}

// MARK: - ScreenCoverView

struct ScreenCoverView: View {
    @EnvironmentObject var appRouter: AppRouter
    let viewWrapper: ViewWrapper

    var body: some View {
        NavigationStack(path: $appRouter.navigationPath) {
            viewWrapper.view
                .navigationDestination(for: ViewWrapper.self) { newWrapper in
                    newWrapper.view
                }
        }
    }
}

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
}

// MARK: - AppRouter

@available(iOS 16.0, *)
class AppRouter: ObservableObject {
    static let shared = AppRouter()
    
    @Published var navigationPath: [ViewWrapper] = []
    @Published var currentSheet: ViewWrapper? = nil
    @Published var currentScreenCover: ViewWrapper? = nil
    @Published var currentHalfSheet: ViewWrapper? = nil
    @Published var halfSheetDetents: [UISheetPresentationController.Detent] = []
    @Published var currentAlert: Alert? = nil
    @Published var currentToast: ViewWrapper? = nil

    func handle(action: RouterAction) {
        DispatchQueue.main.async {
            switch action {
            case .showScreen(let view):
                self.currentScreenCover = ViewWrapper(view: view)
            case .showSheet(let view):
                self.currentSheet = ViewWrapper(view: view)
            case .showHalfSheet(let view, let detents):
                self.currentHalfSheet = ViewWrapper(view: view)
                self.halfSheetDetents = detents.map { $0.value }
            case .showAlert(let alert):
                self.currentAlert = alert
            case .showToast(let type):
                self.currentToast = ViewWrapper(view: AnyView(ToastView(type: type)))
            case .push(let view):
                self.navigationPath.append(ViewWrapper(view: view))
            case .pop:
                if !self.navigationPath.isEmpty {
                    self.navigationPath.removeLast()
                }
            case .popToRoot:
                self.navigationPath.removeAll()
            case .setRootView(let view):
                self.navigationPath = [ViewWrapper(view: view)]
            case .dismiss:
                self.dismiss()
            }
        }
    }

    private func dismiss() {
        self.currentSheet = nil
        self.currentHalfSheet = nil
        self.currentAlert = nil
        self.currentToast = nil
        self.currentScreenCover = nil
    }
}

// MARK: - CustomDetent

enum CustomDetent {
    case small
    case medium
    case large

    var value: UISheetPresentationController.Detent {
        switch self {
        case .small:
            return .custom { context in context.maximumDetentValue * 0.3 }
        case .medium:
            return .custom { context in context.maximumDetentValue * 0.5 }
        case .large:
            return .custom { context in context.maximumDetentValue * 0.7 }
        }
    }
}

// MARK: - ViewWrapper

struct ViewWrapper: Identifiable, Hashable {
    static func == (lhs: ViewWrapper, rhs: ViewWrapper) -> Bool {
        return lhs.id == rhs.id
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
            Text(message).padding().background(Color.gray).cornerRadius(8)
        case .error(let message):
            Text(message).padding().background(Color.red).cornerRadius(8)
        case .warning(let message):
            Text(message).padding().background(Color.yellow).cornerRadius(8)
        case .success(let message):
            Text(message).padding().background(Color.green).cornerRadius(8)
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
                .navigationDestination(for: ViewWrapper.self) { viewWrapper in
                    viewWrapper.view
                }
        }
    }
}

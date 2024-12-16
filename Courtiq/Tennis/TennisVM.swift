//
//  TennisVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import AuthenticationService
import StringEntryService
import SwiftUI

// MARK: - TennisVM

final class TennisVM: ViewModel {
    
    // MARK: - Internal Properties

    @Published var newStringEntry: StringEntry
    
    var router: AppRouter

    // MARK: - Initializer
    
    init(router: AppRouter,
         authService: any AuthServiceProtocol,
         newStringEntry: StringEntry = StringEntry()) {
        self.router = router
        self.authService = authService
        self.newStringEntry = newStringEntry
    }
    
    // MARK: - Internal Methods

    func onAppear() {
    }
    
    func onDisappear() {
    }

    @MainActor func handle(action: TennisVM.Actions) {
        switch action {
        case .showAddString:
            let view = AddStringView(vm: self)
            router.handle(action: .showHalfSheet(AnyView(view), detents: [.large]))
        case .showAddMatch:
            let view = MatchUpFormInfoView(vm: MatchUpVM(router: router))
            router.handle(action: .showScreen(AnyView(view)))
        case .dismissAddString:
            router.handle(action: .dismiss)
        case .addStringEntry:
            addStringEntry()
        }
    }

    // MARK: - Private Methods

    @MainActor
    private func addStringEntry() {
        print("addStringEntry")
    }
    
    // MARK: - Private Properties

    private var authService: any AuthServiceProtocol
    private var stringEntryService = StringEntryService()
}

// MARK: - TennisVM Actions

extension TennisVM {
    enum Actions {
        case showAddString
        case showAddMatch
        case dismissAddString
        case addStringEntry
    }
}

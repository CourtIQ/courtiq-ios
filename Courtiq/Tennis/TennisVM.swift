//
//  TennisViewModel.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import StringEntryService

final class TennisVM: ViewModel {
    
    func handle(action: TennisVM.Actions) {
        switch action {
        case .showAddString:
            let view = AddStringView(vm: self)
//            let view = TestViews()
            router.handle(action: .showHalfSheet(AnyView(view), detents: [.medium]))
        case .showAddMatch:
            let view = AddMatchFormView()
            router.handle(action: .showScreen(AnyView(view)))
        case .dismissAddString:
            router.handle(action: .dismiss)
        case .addStringEntry:
            addStringEntry()
            self.handle(action: .dismissAddString)
        }
    }
    
    private func addStringEntry() {
        print(#function)
    }

    func onAppear() {
    }
    
    func onDisappear() {
    }
    
    init(router: AppRouter, stringEntryService: any StringEntryServiceProtocol)
    {
        self.router = router
        self.stringEntryService = stringEntryService
    }
    
    var router: AppRouter
    var stringEntryService: any StringEntryServiceProtocol
    
}

extension TennisVM {
    enum Actions {
        case showAddString
        case showAddMatch
        case dismissAddString
        case addStringEntry
    }
}

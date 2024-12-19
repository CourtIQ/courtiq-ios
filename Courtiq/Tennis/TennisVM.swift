//
//  TennisVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import AuthenticationService
import EquipmentService
import SwiftUI
import RDDesignSystem

// MARK: - TennisVM

final class TennisVM: ViewModel {
    
    // MARK: - Internal Properties

    @Published var selectedTab: Int = 0
    @Published var newStringEntry = AddTennisStringFormModel()
    @Published var newRacketEntry = AddTennisRacketFormModel()
    @Published var equipmentVM: EquipmentVM


    
    var router: AppRouter

    // MARK: - Initializer
    
    init(router: AppRouter,
         equipmentService: any EquipmentServiceProtocol) {
        self.router = router
        self.equipmentService = equipmentService
        self.equipmentVM = EquipmentVM(equipmentService: equipmentService, router: router)
    }
    
    // MARK: - Internal Methods

    func onAppear() {
    }
    
    func onDisappear() {
    }

    @MainActor func handle(action: TennisVM.Actions) {
        switch action {
        case .showAddString: showAddStringForm()
        case .showAddRacket: showAddRacket()
        case .showCreateClub: showCreateClub()
        case .showAddMatch: showAddMatch()
        case .showTrackMatch: showTrackMatch()
        case .addNewStringEntry: addNewStringEntry()
        case .addNewRacket: addNewRacketEntry()
        }
    }

    // MARK: - Private Methods

    @MainActor
    private func showAddStringForm() {
        let vm = EquipmentVM(equipmentService: equipmentService,
                             router: router)
        let view = AnyView(AddTennisStringFormView(vm: vm))
        router.handle(action: .showHalfSheet(view, detents: [.large]))
    }
    
    @MainActor
    private func showAddRacket() {
        let vm = EquipmentVM(equipmentService: equipmentService,
                             router: router)
        let view = AnyView(AddTennisRacketFormView(vm: vm))
        router.handle(action: .showHalfSheet(view, detents: [.medium]))
    }
    
    @MainActor
    private func showCreateClub() {
        let view = AnyView(CreateClubView())
        router.handle(action: .showHalfSheet(view, detents: [.medium]))
    }
    
    @MainActor
    private func showAddMatch() {
        let vm = MatchUpVM(router: router)
        let view = AnyView(MatchUpFormInfoView(vm: vm))
        router.handle(action: .showSheet(view))
    }
    
    @MainActor
    private func showTrackMatch() {
        let vm = MatchUpVM(router: router)
        let view = AnyView(MatchUpFormInfoView(vm: vm))
        router.handle(action: .showSheet(view))
    }
    
    private func addNewStringEntry() {
        

    }
    
    private func addNewRacketEntry() {
        Task {
            await router.handle(action: .isLoading)
            do {
                try await equipmentService.createTennisRacket(input: newRacketEntry.toCreateInput())
                await MainActor.run {
                    router.handle(action: .dismiss)
                    router.handle(action: .stopLoading)
                    newRacketEntry = AddTennisRacketFormModel()
                }
            } catch {
                print("Error updating document: \(error.localizedDescription)")
            }
        }
    }
    // MARK: - Private Properties
    
    public var equipmentService: any EquipmentServiceProtocol
}

// MARK: - TennisVM Actions

extension TennisVM {
    enum Actions {
        case showAddString
        case showAddRacket
        case showCreateClub
        case showAddMatch
        case showTrackMatch
        case addNewStringEntry
        case addNewRacket
    }
}

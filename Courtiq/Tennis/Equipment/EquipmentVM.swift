//
//  AddEquipmentVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-18.
//

import CourtIQAPI
import EquipmentService
import Foundation
import RDDesignSystem
import SwiftUI
import Models

@MainActor
final class EquipmentVM: ViewModel {
    
    @Published var newTennisRacket = AddTennisRacketFormModel()
    @Published var newTennisString = AddTennisStringFormModel()
    @Published var myRackets: [TennisRacket] = []
    @Published var myStrings: [TennisString] = []

    let racketBrands: [TennisRacketBrand] = []
    public var modelDropdownItems: [DropdownItem] = [DropdownItem(image: Image.Token.Icons.person, title: "Person")]
    
    init(router: AppRouter) {
        self.router = router
    }
    nonisolated func onAppear() {}
    
    nonisolated func onDisappear() {}
    
    func handle(action: Actions) {
        switch action {
        case .addNewTennisRacket: addNewTennisRacket()
        case .addNewTennisString: addNewTennisString()
        case .validateAddNewTennisRacketForm: validateAddNewTennisRacketForm()
        case .validateAddNewTennisStringForm: validateAddNewTennisStringForm()
        case .updateTennisRacket: updateTennisRacket()
        case .updateTennisString: updateTennisString()
        case .deleteTennisRacket: deleteTennisRacket()
        case .deleteTennisString: deleteTennisString()
        case .dismiss: dismiss()
            
        }
    }
    
    private func addNewTennisRacket() {
        Task {
            await router.handle(action: .isLoading)
            do {
                try await equipmentService.createTennisRacket(input: newTennisRacket.toCreateInput())
                router.handle(action: .dismiss)
                router.handle(action: .stopLoading)
                newTennisRacket = AddTennisRacketFormModel()
            } catch {
                print("Error updating document: \(error.localizedDescription)")
            }
        }
    }
    
    private func addNewTennisString() {
        Task {
            router.handle(action: .isLoading)
            do {
                let newTennisStringEntry = try await equipmentService.createTennisString(input: newTennisString.toCreateInput())
                if newTennisStringEntry.id != nil {
                    myStrings.insert(newTennisStringEntry, at: 0)
                }
                await MainActor.run {
                    router.handle(action: .dismiss)
                    router.handle(action: .stopLoading)
                    newTennisString = AddTennisStringFormModel()
                }
            } catch {
                print("Error updating document: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateTennisRacket() {
        print(#function)
    }
    
    private func updateTennisString() {
        print(#function)
    }
    
    private func deleteTennisRacket() {
        print(#function)
    }
    
    private func deleteTennisString() {
        print(#function)
    }
    
    private func validateAddNewTennisRacketForm() {
        print(#function)
    }
    
    private func validateAddNewTennisStringForm() {
        print(#function)
    }
    
    @MainActor private func dismiss() {
        router.handle(action: .dismiss)
    }
    
    @Dependency(\.equipmentService) private var equipmentService
    private let router: AppRouter
    
}

extension EquipmentVM {
    enum Actions {
        case addNewTennisRacket
        case addNewTennisString
        case validateAddNewTennisRacketForm
        case validateAddNewTennisStringForm
        case updateTennisRacket
        case updateTennisString
        case deleteTennisRacket
        case deleteTennisString
        case dismiss
    }
}

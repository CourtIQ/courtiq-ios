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

final class EquipmentVM: ViewModel {
    
    @Published var newTennisRacket = AddTennisRacketFormModel()
    @Published var newTennisString = AddTennisStringFormModel()
    @Published var myRackets: [TennisRacket] = []
    @Published var myStrings: [TennisString] = []
    var myEquipment: [any Equipment] {
        (myRackets as [any Equipment] + myStrings as [any Equipment])
            .sorted { ($0.createdAt ?? Date.distantPast) < ($1.createdAt ?? Date.distantPast) }
    }
    let racketBrands: [TennisRacketBrand]
    public let brandDropdownItems: [DropdownItem]
    public var modelDropdownItems: [DropdownItem] {
        guard let brand = newTennisRacket.brand else { return [] }
        let models = equipmentService.getRacketModels(for: brand)
        return models.map { model in
            DropdownItem(
                image: Image.Token.Icons.tennisBall,
                title: model.model
            )
        }
    }
    init(equipmentService: any EquipmentServiceProtocol,
         router: AppRouter) {
        self.equipmentService = equipmentService
        self.router = router
        racketBrands = equipmentService.getAllRacketBrands()
        brandDropdownItems = racketBrands.map { brand in
            DropdownItem(
                image: Image.Token.Icons.tennisBall, // a placeholder image
                title: brand.brand
            )
        }
        Task {
            do {
                let rackets = try await equipmentService.getMyTennisRackets(limit: 10, offset: 0)
                let strings = try await equipmentService.getMyTennisStrings(limit: 10, offset: 0)
                await MainActor.run {
                    self.myRackets = rackets
                    print(myRackets)
                    self.myStrings = strings
                    print(myStrings)
                }
            } catch {
                print("Error fetching initial equipment data: \(error.localizedDescription)")
            }
        }
    }
    func onAppear() {}
    
    func onDisappear() {}
    
    @MainActor func handle(action: Actions) {
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
                await MainActor.run {
                    router.handle(action: .dismiss)
                    router.handle(action: .stopLoading)
                    newTennisRacket = AddTennisRacketFormModel()
                }
            } catch {
                print("Error updating document: \(error.localizedDescription)")
            }
        }
    }
    
    @MainActor private func addNewTennisString() {
        Task {
            await router.handle(action: .isLoading)
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
    
    public let equipmentService: any EquipmentServiceProtocol
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

//
//  AddTennisRacketFormView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-16.
//

import RDDesignSystem
import SwiftUI

struct AddTennisRacketFormView: View {
    
    // MARK: - Lifecycle
    public init(vm: EquipmentVM) {
        self.vm = vm
    }
    
    var body: some View {

        MarqueeView {
            RDNavigationBar(.primary,
                            title: "Add new racket", leading: {},
                            trailing: {
                Image.Token.Icons.cross
                    .rdActionIcon { print("Hello world")}
            })
        } content: {
            RDTextField(textFieldType: .primary,
                        placeholder: "Racket name",
                        leadingIcon: Image.Token.Icons.tennisBall,
                        value: $vm.newTennisRacket.name)
            HStack {
                
                RDTextField(
                    textFieldType: .dropdown,
                    placeholder: "Brand",
                    onSubmit: { },
                    value: brandBinding,
                    dropdownItems: vm.brandDropdownItems
                )
                RDTextField(
                    textFieldType: .dropdown,
                    placeholder: "Model",
                    onSubmit: { },
                    value: modelBinding,
                    dropdownItems: vm.modelDropdownItems)
            }
            HStack {
                RDNumberInput(placeholder: "Weight",
                              value: weightBinding, range: 50...500,
                              layout: .withoutStepper,
                              fixedWidth: true)
                Spacer()
            }
        } footer: {
            RDButtonView(.medium, .primary, "Add racket") {
                vm.handle(action: .addNewTennisRacket)
            }
        }
        
        
    }
    
    private var weightBinding: Binding<Int> {
        Binding(
            get: { vm.newTennisRacket.weight ?? 0 },
            set: { newWeight in vm.newTennisRacket.weight = newWeight }
        )
    }
    private var brandBinding: Binding<String> {
        Binding(
            get: { vm.newTennisRacket.brand ?? "" },
            set: { newBrandName in
                // Reset model when brand changes
                vm.newTennisRacket.model = nil
                vm.newTennisRacket.modelId = nil
                withAnimation {
                    vm.newTennisRacket.brand = newBrandName
                    let selectedBrand = vm.equipmentService.getRacketBrand(for: newBrandName)
                    vm.newTennisRacket.brandId = selectedBrand.brand_id
                    vm.objectWillChange.send()
                }

            }
        )
    }
    
    private var modelBinding: Binding<String> {
        Binding(
            get: { vm.newTennisRacket.model ?? "" },
            set: { newModelName in
                vm.newTennisRacket.model = newModelName
                if let brand = vm.newTennisRacket.brand {
                    let models = vm.equipmentService.getRacketModels(for: brand)
                    if let selectedModel = models.first(where: { $0.model == newModelName }) {
                        vm.newTennisRacket.modelId = selectedModel.model_id
                    }
                }
            }
        )
    }
    
    @ObservedObject private var vm: EquipmentVM
}

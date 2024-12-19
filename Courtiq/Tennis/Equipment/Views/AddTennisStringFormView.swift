//
//  AddStringView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

// MARK: - AddStringView

struct AddTennisStringFormView: View {
    
    // MARK: - Lifecycle
    public init(vm: EquipmentVM) {
        self.vm = vm
    }
    
    // MARK: - Internal
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Add new string entry", leading: {}, trailing: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.close) {
                    print("Add new string entry")
                }
            })
        } content: {
            RDTextField(
                textFieldType: .primary,
                placeholder: "String name",
                leadingIcon: Image.Token.Icons.envelope,
                trailingIcon: Image(systemName: "number"),
                value: $vm.newTennisString.name)
            
            HStack {
                RDTextField(
                    textFieldType: .primary,
                    placeholder: "String brand",
                    leadingIcon: Image.Token.Icons.tennisBall,
                    value: Binding(
                        get: { vm.newTennisString.brand ?? ""},
                        set: { vm.newTennisString.brand = $0 }
                    ))
                RDTextField(
                    textFieldType: .primary,
                    placeholder: "String model",
                    leadingIcon: Image.Token.Icons.tennisBall,
                    value: Binding(
                        get: { vm.newTennisString.model ?? ""},
                        set: { vm.newTennisString.model = $0 }
                    ))
            }
            
            HStack(alignment: .top, spacing: 12) {
                RDNumberInput(
                    placeholder: "Mains",
                    helperText: "Must be between 20 & 80",
                    value: Binding(
                        get: { vm.newTennisString.mainsTension ?? 50},
                        set: { vm.newTennisString.mainsTension = $0 }
                    ),
                    range: 20...80,
                    layout: .horizontal,
                    fixedWidth: false)
                
                RDNumberInput(
                    placeholder: "Cross",
                    value: Binding(
                        get: { vm.newTennisString.crossTension ?? 50},
                        set: { vm.newTennisString.crossTension = $0 }
                    ),
                    range: 20...80,
                    layout: .horizontal,
                    fixedWidth: false)
            }
            
            RDTextField(
                textFieldType: .date,
                placeholder: "Stringing Date",
                value: $dateString,
                dateValue: $vm.newTennisString.stringingDate,
                state: .constant(.normal)
            )
            RDTextField(
                textFieldType: .date,
                placeholder: "Burst Date",
                value: $dateString,
                dateValue: $vm.newTennisString.burstDate,
                state: .constant(.normal)
            )
        } footer: {
            RDButtonView(.large, .primary, "Add String Entry") {
                vm.handle(action: .addNewTennisString)
                print("Add String Entry")
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Private Properties
    @State private var dateString2: String = ""
    @State private var dateString: String = ""
    
    @ObservedObject private var vm: EquipmentVM
}

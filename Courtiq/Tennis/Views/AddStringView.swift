//
//  AddStringView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem
import StringEntryService
import AuthenticationService

struct AddStringView: View {
    @ObservedObject var vm: TennisVM
    @State private var stringNameState: RDTextFieldUpdated.FieldState = .normal
    @State private var mainsState: RDNumberInput.FieldState = .standard
    @State private var crossState: RDNumberInput.FieldState = .standard

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "New String Entry",
            trailingItem: (
                trailingItemType: .ghost,
                trailingItemIcon: Image(systemName: "xmark"),
                trailingItemAction: {
                    vm.handle(action: .dismissAddString)
                }
            )
        )
    }

    var body: some View {
        MarqueeView {
            RDTopNavigationBar(params: navigationParams)
        } content: {
            Image("welcomeImage")
                .resizable()
                .padding()
                .scaledToFit()

            RDTextFieldUpdated(
                textFieldType: .primary,
                placeholder: "String name",
                icon: (leadingIcon: Image(systemName: "number"), trailingIcon: nil),
                value: $vm.newStringEntry.stringName,
                state: $stringNameState
            )
            
            HStack( alignment: .top, spacing: 12) {
                RDNumberInput(
                    placeholder: "Mains",
                    helperText: "Must be between 20 & 80",
                    value: $vm.newStringEntry.stringMainsTension,
                    range: 20...80,
                    layout: .horizontal,
                    state: $mainsState,
                    fixedWidth: false
                )

                RDNumberInput(
                    placeholder: "Cross",
                    value: $vm.newStringEntry.stringCrossTensions,
                    range: 20...80,
                    layout: .horizontal,
                    state: $crossState,
                    fixedWidth: false
                )
                
                
            }
        } footer: {
            RDButtonView(.large, .primary, "Add String Entry") {
                vm.handle(action: .addStringEntry)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

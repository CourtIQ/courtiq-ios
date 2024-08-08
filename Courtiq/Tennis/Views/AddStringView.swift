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
    @State private var stringNameState: RDTextField.RDTextFieldState = .normal
    @State private var mainsState: RDNumberInput.FieldState = .standard
    @State private var crossState: RDNumberInput.FieldState = .standard

    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Add new string entry", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        vm.handle(action: .dismissAddString)
                    }
            })
        } content: {
            Image("welcomeImage")
                .resizable()
                .padding()
                .scaledToFit()

            RDTextField(
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

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
    @State private var stringNameState: RDTextFieldUpdatedState = .normal
    var body: some View {
        MarqueeView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "New String Entry",
                    trailingItem: AnyView(RDIconButton(
                        .tertiary, .small, Image(systemName: "xmark"),
                        action: {
                            vm.handle(action: .dismissAddString)
                        })
                    )
                )
            )
        } content: {
            Image("welcomeImage")
                .resizable()
                .padding()
                .scaledToFit()

            RDTextFieldUpdated(textFieldType: .primary, placeholder: "String name", icon: (leadingIcon: Image(systemName: "number"), trailingIcon: nil), value: $vm.newStringEntry.stringName, state: $stringNameState)
            RDTextFieldUpdated(textFieldType: .primary, placeholder: "Racket name", icon: (leadingIcon: Image(systemName: "number"), trailingIcon: nil), value: $vm.newStringEntry.stringName, state: $stringNameState)

            HStack(spacing: 12)
            {
                RDNumberInput(placeholder: "Mains",
                              value: $vm.newStringEntry.stringMainsTension,
                              range: 20...80,
                              layout: .horizontal,
                              fixedWidth: false)

                RDNumberInput(placeholder: "Cross",
                              value: $vm.newStringEntry.stringCrossTensions,
                              range: 20...80,
                              layout: .horizontal,
                              fixedWidth: false)
            }
        } footer: {
            RDButtonView(.large, .primary, "Add String Entry") {
                vm.handle(action: .addStringEntry)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

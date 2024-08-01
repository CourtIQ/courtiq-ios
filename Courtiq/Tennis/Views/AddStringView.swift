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

            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "String Name"),
                text: $vm.newStringEntry.stringName)
            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "String Name"),
                text: $vm.newStringEntry.stringEntryID)
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

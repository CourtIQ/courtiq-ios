//
//  AddStringView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem
import StringEntryService

struct AddStringView: View {
    @ObservedObject var vm: TennisVM
    @State private var stringName: String = ""
    @State private var mainsTension: Int = 50
    @State private var crossTension: Int = 50
    @State private var stringingDate: Date = Date()
    
    var body: some View {
        MarqueeView {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "New String Entry",
                    trailingItem: AnyView(RDIconButton(
                        .tertiary, .small, Image(systemName: "plus"),
                        action: {
                            vm.handle(action: .dismissAddString)
                        })
                    )
                )
            )
        } footer: {
            RDButtonView(.small, .secondary, "Add String Entry") {
                vm.handle(action: .addStringEntry)
            }
        } content: {
            Image("welcomeImage")
                .resizable()
                .padding()
                .scaledToFit()

            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "String Name"),
                text: $stringName)

            HStack {
                RDNumberInput(placeholder: "Mains", value: $mainsTension, range: 20...80, layout: .horizontal)

                RDNumberInput(placeholder: "Cross", value: $crossTension, range: 20...80, layout: .horizontal)
            }
            
            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "String Name"),
                text: $stringName,
                validationType: .numbersOnly)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AddStringView(vm: TennisVM(router: AppRouter(), stringEntryService: StringEntryService()))
}

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
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AddStringView(vm: TennisVM(router: AppRouter(), stringEntryService: StringEntryService()))
}

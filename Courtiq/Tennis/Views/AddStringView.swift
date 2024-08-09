//
//  AddStringView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import AuthenticationService
import RDDesignSystem
import StringEntryService
import SwiftUI

// MARK: - AddStringView

struct AddStringView: View {
    
    // MARK: - Internal
    
    @ObservedObject var vm: TennisVM
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Add new string entry", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        vm.handle(action: .dismissAddString)
                    }
            })
        } content: {
            RDTextField(
                textFieldType: .primary,
                placeholder: "String name",
                icon: (leadingIcon: Image(systemName: "number"), trailingIcon: nil),
                value: $vm.newStringEntry.stringName)
            
            RDTextField(
                textFieldType: .primary,
                placeholder: "Racket name",
                icon: (leadingIcon: Image.Token.Icons.tennisBall, trailingIcon: nil),
                value: $vm.newStringEntry.racketName)
            
            HStack(alignment: .top, spacing: 12) {
                RDNumberInput(
                    placeholder: "Mains",
                    helperText: "Must be between 20 & 80",
                    value: $vm.newStringEntry.stringMainsTension,
                    range: 20...80,
                    layout: .horizontal,
                    state: $mainsState,
                    fixedWidth: false)

                RDNumberInput(
                    placeholder: "Cross",
                    value: $vm.newStringEntry.stringCrossTensions,
                    range: 20...80,
                    layout: .horizontal,
                    state: $crossState,
                    fixedWidth: false)
            }
        } footer: {
            RDButtonView(.large, .primary, "Add String Entry") {
                vm.handle(action: .addStringEntry)
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Private Properties
    
    @State private var mainsState: RDNumberInput.FieldState = .standard
    @State private var crossState: RDNumberInput.FieldState = .standard
}

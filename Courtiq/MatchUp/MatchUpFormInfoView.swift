//
//  MatchUpFormView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import MatchUpService
import RDDesignSystem
import RelationshipService
import SwiftUI

// MARK: - MatchUpFormInfoView

struct MatchUpFormInfoView: View {
    
    // MARK: - Lifecycle
    
    init(vm: MatchUpVM) 
    {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    // MARK: - Internal

    @EnvironmentObject private var relationsService: RelationshipService
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Track a new match", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        vm.handle(action: .dismissTapped)
                    }
            })
        } content: {
            // TODO: Allow selection of players from friends list or just a custom name
            HStack(spacing: 8) {
                Text("Match Type")
                    .rdBody()
                    .foregroundColor(Color.TokenColor.Semantic.Text.default)
                RDSegmentControl(MatchUpType.allCases, selection: selectedMatchUpType) { item in
                    Text(item.description)
                        .rdBody()
                        .foregroundColor(selectedMatchUpType == item ? Color.TokenColor.Semantic.Text.inverted : Color.TokenColor.Semantic.Text.primary)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            withAnimation {
                                selectedMatchUpType = item
                            }
                        }
                }
                .cornerRadius(10)
            }
            
            RDTextField(textFieldType: .dropdown,
                        placeholder: "Player 1",
                        leadingIcon: Image.Token.Icons.person,
                        value: $player1,
                        dropdownItems: [DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Pranav"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Suri"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Jake"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Paul")])
            
            RDTextField(textFieldType: .dropdown,
                        placeholder: "Player 2",
                        leadingIcon: Image.Token.Icons.person,
                        value: $player2,
                        dropdownItems: [DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Pranav"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Suri"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Jake"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Paul")])
        } footer: {
            RDButtonView(.large, .primary, "Next", disable: isNextButtonDisabled, action: {
                vm.handle(action: .goToMatchFormatForm)
            })
        }
    }
    
    // MARK: - Private
    
    @StateObject private var vm: MatchUpVM
    @State private var player1: String = ""
    @State private var player2: String = ""
    @State private var selectedInt: Int = 0
    @State private var selectedMatchUpType: MatchUpType? = .singles
    
    private var isNextButtonDisabled: Bool {
        player1.isEmpty || player2.isEmpty
    }
}

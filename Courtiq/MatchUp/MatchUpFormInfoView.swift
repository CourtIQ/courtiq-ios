//
//  MatchUpFormView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem
import RelationshipService
import MatchUpService

struct MatchUpFormInfoView: View {
    @ObservedObject var router: AppRouter
    @State private var player1: String = ""
    @State private var player2: String = ""
    @State private var selectedInt: Int = 0
    @State private var selectedMatchUpType: MatchUpType? = .singles

    @EnvironmentObject private var relationsService: RelationshipService
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Track a new match", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        router.handle(action: .dismiss)
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
                        icon: (leadingIcon: Image.Token.Icons.person, trailingIcon: nil),
                        value: $player1,
                        dropdownItems: [DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello")])
            
            RDTextField(textFieldType: .dropdown,
                        placeholder: "Player 2",
                        icon: (leadingIcon: Image.Token.Icons.person, trailingIcon: nil),
                        value: $player1,
                        dropdownItems: [DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello"),
                                        DropdownItem(image: Image.Token.Icons.envelope, title: "Hello")])
        } footer: {
            RDButtonView(.extraLarge, .ghost, "Next") {
                router.handle(action: .push(AnyView(Text("Hello"))))
            }
        }
    }
}

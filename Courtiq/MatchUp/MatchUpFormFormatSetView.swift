//
//  MatchUpFormFormatSetView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-12.
//

import MatchUpService
import RDDesignSystem
import SwiftUI

// MARK: - MatchUpFormFormatSetView

struct MatchUpFormFormatSetView: View {
    
    // MARK: - Lifecycle
    
    init(vm: MatchUpVM) {
        self.vm = vm
    }
    
    // MARK: - Internal
    
    var body: some View {
        RDCardView(type: .secondary) {
            VStack(spacing: 12) {
                title
                
                numberOfGamesView()
                
                deuceTypeView()
                
                mustWinByTwoGamesToggle()
                
                if !vm.matchUpFormat.setFormat.mustWinByTwo {
                    tiebreakToggle()
                }
            }
        }
    }
    
    // MARK: - Private Subviews
    
    @ViewBuilder
    private var title: some View {
        HStack{
            Spacer()
            Text("Set Format")
                .rdBodyBold()
                .foregroundColor(Color.TokenColor.Semantic.Text.primary)
            Spacer()
        }
    }
    
    @ViewBuilder
    private func numberOfGamesView() -> some View {
        RDNumberInput(
            placeholder: "No. of Games",
            value: Binding(
                get: { vm.matchUpFormat.setFormat.numberOfGames.rawValue },
                set: { newValue in
                    if let numberOfGames = NumberOfGames(rawValue: newValue) {
                        vm.matchUpFormat.setFormat.numberOfGames = numberOfGames
                    }}),
            range: NumberOfGames.one.rawValue...NumberOfGames.ten.rawValue,
            fixedWidth: false)
    }
    
    @ViewBuilder
    private func deuceTypeView() -> some View {
        RDSegmentControl(DeuceType.allCases, selection: vm.matchUpFormat.setFormat.deuceType) { item in
            Text(item.description)
                .rdBody()
                .foregroundColor(vm.matchUpFormat.setFormat.deuceType == item ? Color.TokenColor.Semantic.Text.inverted : Color.TokenColor.Semantic.Text.primary)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation {
                        vm.matchUpFormat.setFormat.deuceType = item
                    }
                }
        }
    }
    
    private func mustWinByTwoGamesToggle() -> some View {
        RDToggleRow(title: "Must win set by 2 games?", isOn: $vm.matchUpFormat.setFormat.mustWinByTwo)
            .disabled(vm.matchUpFormat.setFormat.tiebreakFormat != nil)
    }
    
    private func tiebreakToggle() -> some View {
        RDToggleRow(title: "Tiebreak?", isOn: Binding(
            get: { vm.matchUpFormat.setFormat.tiebreakFormat != nil },
            set: { newValue in
                if newValue {
                    vm.matchUpFormat.setFormat.tiebreakFormat = TiebreakFormat()
                } else {
                    vm.matchUpFormat.setFormat.tiebreakFormat = nil
                }
            })
        )
    }
    
    // MARK: - Private Properties
    
    @ObservedObject private var vm: MatchUpVM
}

#Preview {
    MatchUpFormFormatSetView(vm: MatchUpVM())
}

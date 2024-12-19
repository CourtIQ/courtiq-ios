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
    
    init(vm: MatchUpVM, setFormat: Binding<SetFormat>, title: String) {
        self.vm = vm
        self._setFormat = setFormat
        self.titleText = title
    }
    
    // MARK: - Internal
    
    var body: some View {
        RDCard(type: .secondary) {
            VStack(spacing: 12) {
                title
                
                numberOfGamesView()
                
                deuceTypeView()
                
                mustWinByTwoGamesToggle()
                
                if !setFormat.mustWinByTwo {
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
            Text(titleText)
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
                get: { setFormat.numberOfGames.rawValue },
                set: { newValue in
                    if let numberOfGames = NumberOfGames(rawValue: newValue) {
                        setFormat.numberOfGames = numberOfGames
                    }}),
            range: NumberOfGames.one.rawValue...NumberOfGames.ten.rawValue,
            fixedWidth: false)
    }
    
    @ViewBuilder
    private func deuceTypeView() -> some View {
        RDSegmentControl(DeuceType.allCases, selection: setFormat.deuceType) { item in
            Text(item.description)
                .rdBody()
                .foregroundColor(setFormat.deuceType == item ? Color.TokenColor.Semantic.Text.inverted : Color.TokenColor.Semantic.Text.primary)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation {
                        setFormat.deuceType = item
                    }
                }
        }
    }
    
    private func mustWinByTwoGamesToggle() -> some View {
        RDToggleRow(title: "Must win set by 2 games?", isOn: $setFormat.mustWinByTwo)
            .disabled(setFormat.tiebreakFormat != nil)
    }
    
    private func tiebreakToggle() -> some View {
        RDToggleRow(title: "Tiebreak?", isOn: Binding(
            get: { setFormat.tiebreakFormat != nil },
            set: { newValue in
                if newValue {
                    setFormat.tiebreakFormat = TiebreakFormat()
                } else {
                    setFormat.tiebreakFormat = nil
                }
            })
        )
    }
    
    // MARK: - Private Properties
    
    @ObservedObject private var vm: MatchUpVM
    @Binding private var setFormat: SetFormat
    private let titleText: String
}

#Preview {
    MatchUpFormFormatSetView(vm: MatchUpVM(router: AppRouter()), setFormat: .constant(SetFormat()), title: "Set Format")
}

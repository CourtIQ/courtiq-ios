//
//  MatchUpFormFormatTiebreakView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-12.
//

import MatchUpService
import RDDesignSystem
import SwiftUI

// MARK: - MatchUpFormFormatTiebreakView

struct MatchUpFormFormatTiebreakView: View {
    
    // MARK: - Lifecycle
    
    init(vm: MatchUpVM) {
        self.vm = vm
    }
    
    // MARK: - Internal
    
    var body: some View {
        if vm.matchUpFormat.setFormat.tiebreakFormat != nil {
            RDCardView(type: .secondary) {
                VStack(alignment: .leading, spacing: 8) {
                    title
                    numberOfPointsView()
                    mustWinByTwoPointsToggle()
                    tiebreakAtView()
                }
            }
        }
    }
    
    // MARK: - Private Subviews
    
    @ViewBuilder
    private var title: some View {
        HStack {
            Text("Tiebreak Format")
                .rdBody()
                .foregroundColor(Color.TokenColor.Semantic.Text.default)
            Spacer()
        }
    }
    
    @ViewBuilder
    private func numberOfPointsView() -> some View {
        RDNumberInput(
            placeholder: "No. of Points",
            value: Binding(
                get: { vm.matchUpFormat.setFormat.tiebreakFormat?.tiebreakPoints.rawValue ?? 0 },
                set: { newValue in
                    if let tiebreakPoints = TiebreakPoints(rawValue: newValue) {
                        vm.matchUpFormat.setFormat.tiebreakFormat?.tiebreakPoints = tiebreakPoints
                    }
                }
            ),
            range: NumberOfGames.one.rawValue...NumberOfGames.ten.rawValue,
            fixedWidth: false
        )
    }
    
    @ViewBuilder
    private func mustWinByTwoPointsToggle() -> some View {
        RDToggleRow(
            title: "Must win tiebreak by 2 points?",
            isOn: Binding(
                get: { vm.matchUpFormat.setFormat.tiebreakFormat?.mustWinByTwo ?? false },
                set: { newValue in
                    vm.matchUpFormat.setFormat.tiebreakFormat?.mustWinByTwo = newValue
                }
            )
        )
    }
    
    @ViewBuilder
    private func tiebreakAtView() -> some View {
        RDSegmentControl(tiebreakAtOptions, selection: vm.matchUpFormat.setFormat.tiebreakAt ?? 0) { item in
            Text("\(item)")
                .rdBody()
                .foregroundColor(vm.matchUpFormat.setFormat.tiebreakAt == item ? Color.TokenColor.Semantic.Text.inverted : Color.TokenColor.Semantic.Text.primary)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation {
                        vm.matchUpFormat.setFormat.tiebreakAt = item
                    }
                }
        }
    }
    
    // MARK: - Private Properties
    
    private var tiebreakAtOptions: [Int] {
        let base = vm.matchUpFormat.setFormat.numberOfGames.rawValue
        return (base-1...base+1).map { $0 }
    }
    
    @ObservedObject private var vm: MatchUpVM
}

#Preview {
    MatchUpFormFormatTiebreakView(vm: MatchUpVM())
}

//
//  MatchUpFormFormatTiebreakUnifiedView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-12.
//

import MatchUpService
import RDDesignSystem
import SwiftUI

// MARK: - MatchUpFormFormatTiebreakUnifiedView

struct MatchUpFormFormatTiebreakView: View {
    
    // MARK: - Lifecycle
    
    init(vm: MatchUpVM, setFormat: Binding<SetFormat>, title: String) {
        self.vm = vm
        self._setFormat = setFormat
        self.titleText = title
    }
    
    // MARK: - Internal
    
    var body: some View {
        if setFormat.tiebreakFormat != nil {
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
            Text(titleText)
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
                get: { setFormat.tiebreakFormat?.tiebreakPoints.rawValue ?? 0 },
                set: { newValue in
                    if let tiebreakPoints = TiebreakPoints(rawValue: newValue) {
                        setFormat.tiebreakFormat?.tiebreakPoints = tiebreakPoints
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
                get: { setFormat.tiebreakFormat?.mustWinByTwo ?? false },
                set: { newValue in
                    setFormat.tiebreakFormat?.mustWinByTwo = newValue
                }
            )
        )
    }
    
    @ViewBuilder
    private func tiebreakAtView() -> some View {
        HStack {
            Text("Tiebreak at")
                .rdBody()
                .foregroundColor(Color.TokenColor.Semantic.Text.default)
            RDSegmentControl(tiebreakAtOptions, selection: setFormat.tiebreakAt ?? 0) { item in
                Text("\(item)")
                    .rdBody()
                    .foregroundColor(setFormat.tiebreakAt == item ? Color.TokenColor.Semantic.Text.inverted : Color.TokenColor.Semantic.Text.primary)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        withAnimation {
                            setFormat.tiebreakAt = item
                        }
                    }
            }
        }
    }
    
    // MARK: - Private Properties
    
    private var tiebreakAtOptions: [Int] {
        let base = setFormat.numberOfGames.rawValue
        return (base-1...base+1).map { $0 }
    }
    
    @ObservedObject private var vm: MatchUpVM
    @Binding private var setFormat: SetFormat
    private let titleText: String
}

#Preview {
    MatchUpFormFormatTiebreakView(vm: MatchUpVM(router: AppRouter()), setFormat: .constant(SetFormat()), title: "Tiebreak Format")
}

//
//  MatchUpFormFormatView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-11.
//

import RDDesignSystem
import SwiftUI
import MatchUpService

// MARK: - MatchUpFormFormatView

struct MatchUpFormFormatView: View {
    
    // MARK: Lifecycle
    
    public init(vm: MatchUpVM) {
        self.vm = vm
    }
    
    // MARK: - Internal
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Match Up Format", leading: {},
                            trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        appRouter.handle(action: .popToRoot)
                        appRouter.handle(action: .dismiss)
                    }
            })
        } content: {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("No. of sets")
                        .rdBody()
                        .foregroundColor(Color.TokenColor.Semantic.Text.default)
                    RDSegmentControl(NumberOfSets.allCases, selection: vm.matchUpFormat.numberOfSets) { item in
                        Text(item.description)
                            .rdBody()
                            .foregroundColor(vm.matchUpFormat.numberOfSets == item ? Color.TokenColor.Semantic.Text.inverted : Color.TokenColor.Semantic.Text.primary)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation {
                                    vm.matchUpFormat.numberOfSets = item
                                }
                            }
                    }
                }
                
                MatchUpFormFormatSetView(
                    vm: vm,
                    setFormat: Binding(
                        get: { vm.matchUpFormat.setFormat },
                        set: { vm.matchUpFormat.setFormat = $0 }
                    ),
                    title: "Set Format"
                )

                MatchUpFormFormatTiebreakView(
                    vm: vm,
                    setFormat: Binding(
                        get: { vm.matchUpFormat.setFormat },
                        set: { vm.matchUpFormat.setFormat = $0 }
                    ),
                    title: "Tiebreak Format"
                )

                if vm.matchUpFormat.numberOfSets != .one {
                    RDToggleRow(title: "Custom final set format?", isOn: Binding(
                        get: { vm.matchUpFormat.finalSetFormat != nil },
                        set: { newValue in
                            if newValue {
                                vm.matchUpFormat.finalSetFormat = SetFormat()
                            } else {
                                vm.matchUpFormat.finalSetFormat = nil
                            }
                        })
                    )
                    .padding(.horizontal, 4)
                }
                
                if let finalSetFormat = vm.matchUpFormat.finalSetFormat {
                    MatchUpFormFormatSetView(
                        vm: vm,
                        setFormat: Binding(
                            get: { finalSetFormat },
                            set: { vm.matchUpFormat.finalSetFormat = $0 }
                        ),
                        title: "Final Set Format"
                    )
                }

                if let finalSetFormat = vm.matchUpFormat.finalSetFormat {
                    MatchUpFormFormatTiebreakView(
                        vm: vm,
                        setFormat: Binding(
                            get: { finalSetFormat },
                            set: { vm.matchUpFormat.finalSetFormat = $0 }
                        ),
                        title: "Final Set Tiebreak Format"
                    )
                }
            }
        } footer: {
            RDButtonView(.large, .primary, "Start match") {
                appRouter.handle(action: .push(AnyView(Text("Hello"))))
            }
        }
    }
    
    // MARK: - Private
    
    @ObservedObject private var vm: MatchUpVM
    @EnvironmentObject private var appRouter: AppRouter
}

#Preview {
    MatchUpFormFormatView(vm: MatchUpVM(router: AppRouter()))
}

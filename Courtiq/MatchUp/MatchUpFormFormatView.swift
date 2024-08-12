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
                        appRouter.handle(action: .dismiss)
                    }
            })
        } content: {
            
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
            
            MatchUpFormFormatSetView(vm: vm)
            
            MatchUpFormFormatTiebreakView(vm: vm)
            

            
            
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

//#Preview {
//    MatchUpFormFormatView()
//}

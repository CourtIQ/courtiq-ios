//  TennisView.swift
//  YourAppName
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem

// MARK: - TennisView

struct TennisView: View {
    
    // MARK: - Lifecycle
    
    public init(showSideMenu: Binding<Bool>, vm: TennisVM) {
        self._showSideMenu = showSideMenu
        self._vm = StateObject(wrappedValue: vm)
    }
    
    // MARK: - Internal
    
    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "Tennis", leading: {
                Image.Token.Icons.menu
                    .rdActionIcon {
                        showSideMenu.toggle()
                    }
            }, trailing: {
                Menu {
                    Button { vm.handle(action: .showAddString )} label: {
                        Text("Add String Entry")
                    }
                    Button { vm.handle(action: .showAddMatch )} label: {
                        Text("Track New Match")
                    }
                } label: {
                    Image.Token.Icons.add
                        .rdActionIcon {
                            vm.handle(action: .showAddMatch)
                        }
                }
            })
        } content: {
            Text("TennisView")
        }
    }
    
    // MARK: - Private
    
    @Binding private var showSideMenu: Bool
    @StateObject private var vm: TennisVM
}

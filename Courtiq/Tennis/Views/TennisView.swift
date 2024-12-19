//
//  TennisView.swift
//  YourAppName
//
//  Created by Pranav Suri on 2024-07-31.
//

import SwiftUI
import RDDesignSystem
import EquipmentService

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
            navigationBar
            searchField
            tabControl
        } content: {
            selectedView
        }
    }
    
    // MARK: - Private
    
    @State public var selectedTab: Int = 0
    @State private var searchText: String = ""
    @Binding private var showSideMenu: Bool
    @StateObject private var vm: TennisVM
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var equipmentService: EquipmentService
}

// MARK: - Subviews

private extension TennisView {
    
    var navigationBar: some View {
        RDNavigationBar(
            .primary,
            title: "Tennis",
            leading: { leadingContent },
            trailing: { trailingContent }
        )
    }

    var leadingContent: some View {
        RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.menu) {
            showSideMenu.toggle()
        }
    }

    var trailingContent: some View {
        menuButton
    }
    
    var menuButton: some View {
        Menu {
            matchMenu
            equipmentMenu
            Button { vm.handle(action: .showCreateClub) } label: {
                Text("Create new club")
            }
        } label: {
            Image.Token.Icons.add
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.TokenColor.Semantic.Icon.primary)
        }
    }
    
    var matchMenu: some View {
        Menu {
            Button { vm.handle(action: .showTrackMatch) } label: {
                Text("Track live match")
            }
            Button { vm.handle(action: .showAddMatch) } label: {
                Text("Add match record")
            }
        } label: {
            Text("Match")
        }
    }
    
    var equipmentMenu: some View {
        Menu {
            Button { vm.handle(action: .showAddRacket) } label: {
                Text("Add tennis racket")
            }
            Button { vm.handle(action: .showAddString) } label: {
                Text("Add stringing entry")
            }
        } label: {
            Text("Equipment")
        }
    }
    
    var searchField: some View {
        RDTextField(
            textFieldType: .search,
            placeholder: "Search...",
            onSubmit: { print("Search Pressed") },
            value: $searchText,
            state: .constant(.normal)
        )
        .padding(.horizontal, 12)
        .padding(.bottom, 4)
    }
    
    var tabControl: some View {
        RDTabControl(
            selectedTab: $selectedTab,
            tabControlItems: [
                TabControlItem(tag: 0, label: "All", icon: Image.Token.Icons.world),
                TabControlItem(tag: 1, label: "Matches", icon: Image.Token.Icons.world),
                TabControlItem(tag: 2, label: "Clubs", icon: Image.Token.Icons.world),
                TabControlItem(tag: 3, label: "Coaches", icon: Image.Token.Icons.world),
                TabControlItem(tag: 4, label: "Equipment", icon: Image.Token.Icons.world)
            ]
        )
    }
    
    @ViewBuilder
    var selectedView: some View {
        switch vm.selectedTab {
        case 0:
            TennisAllView()
        case 1:
            TennisMatchesListView()
        case 2:
            TennisClubsListView()
        case 3:
            TennisCoachesListView()
        case 4:
            EquipmentListView(vm: vm.equipmentVM)
        default:
            TennisAllView()
        }
    }
}

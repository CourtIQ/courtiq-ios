import SwiftUI
import RDDesignSystem

struct TennisView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var router: AppRouter
    @StateObject var vm: TennisVM
    @State private var isMenuPresented: Bool = false // State for managing menu visibility

    private var navigationParams: RDTopNavigationParams {
        RDTopNavigationParams(
            type: .primary,
            title: "Tennis",
            leadingItem: (
                leadingItemType: .tertiary,
                leadingItemIcon: Image(systemName: "line.horizontal.3"),
                leadingItemAction: {
                    showSideMenu.toggle() // Toggle side menu
                }
            ),
            trailingItem: (
                trailingItemType: .tertiary,
                trailingItemIcon: Image("play"),
                trailingItemAction: {
                    isMenuPresented.toggle() // Toggle menu visibility
                }
            )
        )
    }

    var body: some View {
        BaseTabPageView {
            RDTopNavigationBar(
                params: navigationParams
            )
            .environmentObject(router)
            .overlay(
                // Conditionally present the menu overlay
                MenuView()
                    .opacity(isMenuPresented ? 1 : 0)
                    .animation(.easeInOut, value: isMenuPresented)
            )
        } content: {
            Text("TennisView")
        }
    }
    
    private func MenuView() -> some View {
        VStack {
            Menu(content: {
                Button("AddStringView") {
                    vm.handle(action: .showAddString)
                }
                Button("AddMatchView") {
                    vm.handle(action: .showAddMatch)
                }
            }, label: {
                Text("Menu")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            })
            .frame(maxWidth: 200) // Adjust the size as needed
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 10)
        }
        .padding()
    }
}

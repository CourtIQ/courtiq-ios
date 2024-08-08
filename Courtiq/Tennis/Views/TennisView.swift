import SwiftUI
import RDDesignSystem

struct TennisView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var router: AppRouter
    @StateObject var vm: TennisVM

    var body: some View {
        BaseTabPageView {
            RDNavigationBar(.primary, title: "Tennis", leading: {
                Image.Token.Icons.menu
                    .rdActionIcon {
                        showSideMenu.toggle()
                    }
            }, trailing: {
                Image.Token.Icons.add
                    .rdActionIcon {
                        vm.handle(action: .showAddMatch)
                    }
            })

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

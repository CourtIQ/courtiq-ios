//import SwiftUI
//import RDDesignSystem
//
//struct HomeTabPage<Content: View>: View {
//    @Binding var showMenu: Bool
//    let content: Content
//    var navigationBarType: RDTopNavigationType = .primary
//    var leadingView: AnyView?
//    var trailingView: AnyView?
//    var navigationBarTitle: String? = ""
//
//    init(showMenu: Binding<Bool>, navigationParam: RDTopNavigationParams? = nil, @ViewBuilder content: () -> Content) {
//        self._showMenu = showMenu
//        self.content = content()
//        self.navigationParam = navigationParam ?? RDTopNavigationParams(
//            type: .primary,
//            title: "",
//            leadingItem: AnyView(
//                RDIconButton(
//                    .tertiary,
//                    .small,
//                    Image(systemName: "line.horizontal.3")
//                ) {
//                    showMenu.wrappedValue.toggle()
//                }
//            )
//        )
//    }
//
//    var body: some View {
//        VStack(spacing: 0) {
//            RDTopNavigationView(
//                params: navigationParam
//            )
//            .padding(12)
//            content
//            Spacer()
//        }
//        .background(Color(.systemBackground))
//    }
//}
//
//struct HomeTabPage_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTabPage(showMenu: .constant(false)) {
//            VStack {
//                Text("Content goes here")
//            }
//        }
//    }
//}

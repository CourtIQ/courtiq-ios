//
//  ProfileView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService
import StorageService

// MARK: - ProfileView

struct ProfileView: View {
    // MARK: - Properties
    
    @Binding var showSideMenu: Bool
    @StateObject private var vm: ProfileVM
    @EnvironmentObject private var userStore: UserStore
    
    init(showSideMenu: Binding<Bool>,
         userService: UserService,
         authService: AuthService,
         router: AppRouter) {
        self._showSideMenu = showSideMenu
        self._vm = StateObject(wrappedValue: ProfileVM(userService: userService, authService: authService, router: router))
    }
    
    // MARK: - Body

    var body: some View {
        
        BaseTabPageView {
            RDNavigationBar(.primary, title: "Profile", leading: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.menu) {
                    showSideMenu.toggle()
                }
            }, trailing: {
                RDActionIcon(type: .ghost, size: .medium, image: Image.Token.Icons.settings) {
                    vm.handle(action: .settingsIconTapped)
                }
            })
        } content: {
            if let user = userStore.currentUser {
                ProfileCardView(name: user.displayName,
                                username: user.username,
                                city: user.location?.city,
                                gender: user.gender?.displayName,
                                age: "23")
                .padding(.horizontal, 16)

            }
        }

    }
}

// MARK: - Preview

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        let userService = UserService()
//        let authService = AuthService(provider: FirebaseAuthProvider())
//        let router = AppRouter()
//        
//        ProfileView(showSideMenu: .constant(false), userService: userService, authService: authService, router: router)
//    }
//}

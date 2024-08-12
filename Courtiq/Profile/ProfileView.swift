//
//  ProfileView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-07-08.
//

import AuthenticationService
import RDDesignSystem
import RelationshipService
import SwiftUI
import UserService
import StorageService

// MARK: - ProfileView

struct ProfileView: View {
    // MARK: - Properties
    
    @Binding var showSideMenu: Bool
    @StateObject private var vm: ProfileVM
    @EnvironmentObject private var relationsService: RelationshipService
    
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
                Image.Token.Icons.menu
                    .rdActionIcon {
                        showSideMenu.toggle()
                    }
            }, trailing: {
                Image.Token.Icons.settings
                    .rdActionIcon {
                        vm.handle(action: .settingsIconTapped)
                    }
            })
        } content: {
            ScrollView
            {
                // Profile Card View
                ProfileCardView(vm: vm)
                
                // Add a groups list
                ProfileClubsListView()
                
                if relationsService.friendRequests.isEmpty {
                    // Empty Friends View
                    Text("no friends")
                } else {
                    // Friends List View
                    ForEach(relationsService.friendRequests) { request in
                        Text(request.senderID ?? "")
                    }
                }
            }
        }
        .onAppear {
            print(relationsService.friendRequests)
        }
    }
}

// MARK: - Preview

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let userService = UserService()
        let authService = AuthService(provider: FirebaseAuthProvider())
        let router = AppRouter()
        
        ProfileView(showSideMenu: .constant(false), userService: userService, authService: authService, router: router)
    }
}

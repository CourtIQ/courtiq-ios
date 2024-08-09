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
    @EnvironmentObject var storagService: StorageService
    
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
            
            RDCardView(type: .primary) {
                HStack(alignment: .top, spacing: 12) {
                    
                    ProfileCardPictureView(imageUrl: URL(string: vm.userService.currentUser?.imageUrl ?? ""), size: .large)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        if let currentUser = vm.userService.currentUser {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("\(currentUser.firstName ?? "-") \(currentUser.lastName ?? "-")")
                                    .rdBodyBold()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.default)

                                Text("🇮🇳 USA  |  Age 18")
                                    .rdSmallBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.primary)
                            }

                            RDActionRow(
                                actionItems: [(value: "24",
                                               title: "Rating",
                                               action: { vm.handle(action: .actionRowItemTapped) }),
                                              (value: "12",
                                               title: "Rank",
                                               action: { vm.handle(action: .actionRowItemTapped) }),
                                              (value: "5",
                                               title: "Level",
                                               action: { vm.handle(action: .actionRowItemTapped) }),
                                              (value: "3",
                                               title: "Division",
                                               action: { vm.handle(action: .actionRowItemTapped) })
                                ])
                        }
                        

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }
            XelaChart(type: .Pie, labels: ["A", "B", "C"], datasetPieChart: XelaPieDatasets(dataset: XelaPieChartDataset(label: "A", data: [4.5,8.8,7.4], fillColors: [.red,.blue,.green100])))
            .onAppear {
                Task {
                }
                
            }
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

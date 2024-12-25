//
//  AuthenticationWelcomeView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-23.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI
import UserService

// MARK: AuthenticationWelcomeView

struct AuthenticationWelcomeView: View {
    
    // MARK: Internal
    
    init(vm: AuthenticationVM) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    // TEMPORARY
    let pages: [Color] = [.red, .green, .blue, .yellow, .orange]

    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Welcome to CourtIQ")
        } content: {
            
            // TODO: Add 3/4 Images as a slideshow
            VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(pages.indices, id: \.self) { index in
                        Image("welcomeImage")
                            .resizable()
                            .padding()
                            .scaledToFit()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                RDPageIndicator(type: .capsule,
                                pageCount: pages.count,
                                selectedIndex: $selectedIndex)
                Spacer()
            }
        } footer: {
            RDButtonView(.extraLarge, .primary, "Create an account.") {
                vm.handle(action: .goToSignUp)
            }
            RDButtonView(.extraLarge, .secondary, "Log in") {
                vm.handle(action: .goToSignIn)
            }
            HStack {
                Spacer()
                Text("or")
                    .rdSmallBody()
                    .foregroundColor(Color.TokenColor.Semantic.Text.default)
                Spacer()
            }
            RDButtonView(.extraLarge, .tertiary, "Sign in with Google",
                         trailingIcon: Image.Token.Icons.google) {
                vm.handle(action: .continueWithGoogleBtn)
            }
        }
        .background(Color.TokenColor.Semantic.Background.default)
        .onAppear() {
            if additionalInfoRequired && isUserLoggedIn {
                vm.handle(action: .goToAddInfo)
            }
        }
    }
    
    // MARK: - Private
    
    @State private var selectedIndex = 0
    @AppStorage("additionalInfoRequired") private var additionalInfoRequired: Bool = false
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    @StateObject private var vm: AuthenticationVM
}

// MARK: - Preview

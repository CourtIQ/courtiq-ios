//
//  ProfileCardView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-09.
//

import RDDesignSystem
import SwiftUI
import UserService
import AuthenticationService

struct ProfileCardView: View {
    
    // MARK: - Lifecycle

    init(name: String? = nil, username: String? = nil, city: String? = nil, gender: String? = nil, age: String? = nil) {
        self.name = name
        self.username = username
        self.city = city
        self.gender = gender
        self.age = age
    }

    // MARK: - Internal

    var body: some View {
        RDCard(type: .primary) {
            Group {
                HStack(alignment: .top, spacing: 8) {
                    AvatarImage(size: .medium,
                                url: "https://picsum.photos/200/200")
                    VStack(alignment: .leading, spacing: 2) {
                        if let name = name {
                            Text(name)
                                .rdSubheadline()
                                .foregroundStyle(Color.TokenColor.Semantic.Text.default)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            if let username = username {
                                Text("@\(username)")
                                    .rdSmallBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                            }
                            if let city = city, let gender = gender, let age = age {
                                Text("📍 \(city) | \(gender) | \(age)")
                                    .rdSmallBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                            } else if let city = city {
                                Text("📍 \(city)")
                                    .rdSmallBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                            } else if let gender = gender {
                                Text(gender)
                                    .rdSmallBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                            } else if let age = age {
                                Text(age)
                                    .rdSmallBody()
                                    .foregroundStyle(Color.TokenColor.Semantic.Text.secondary)
                            }
                        }
                    }
                    Spacer()
                    RDActionIcon(type: .ghost,
                                 size: .small, image: Image.Token.Icons.write) {
                        print("edit pressed")
                    }
                }
            }
        }
    }

    // MARK: - Private

    private var name: String?
    private var username: String?
    private var city: String?
    private var gender: String?
    private var age: String?
}

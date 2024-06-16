//
//  RDTopNavigationComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 15/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDTopNavigationComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primary,
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
            
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
            
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .onlySearchWithIcons,
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
            
            RDTopNavigationView(
                params: RDTopNavigationParams(
                    type: .primaryWithProfileAvatar,
                    title: "Dashboard",
                    leadingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    ),
                    trailingItem: AnyView(
                        Image("ic_PlaceholderBlack")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .frame(width: 56, height: 56)
                    )
                ),
                searchText: .constant("")
            )
        }
        .navigationTitle("Toggle")
        .padding()
        .background(.gray)
    }
}

struct RDTopNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDTopNavigationComponent()
    }
}

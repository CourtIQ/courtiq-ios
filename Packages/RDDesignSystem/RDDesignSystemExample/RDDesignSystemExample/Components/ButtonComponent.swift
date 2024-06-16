//
//  ButtonComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 09/11/2023.
//

import SwiftUI
import RDDesignSystem

struct ButtonComponent: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .primary,
                        "Primary Button XL",
                        icon: ("ic_PlaceholderWhite", "ic_PlaceholderWhite")
                    )
                    
                    RDButtonView(
                        .large,
                        .primary,
                        "Primary Button L"
                    )
                    
                    RDButtonView(
                        .medium,
                        .primary,
                        "Primary Button M",
                        icon: ("ic_PlaceholderWhite", "ic_PlaceholderWhite")
                    )
                    
                    RDButtonView(
                        .small,
                        .primary,
                        "Primary Button S"
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .primary,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    RDButtonView(
                        .large,
                        .primary,
                        "Primary Button L",
                        disable: true
                    )
                    
                    RDButtonView(
                        .medium,
                        .primary,
                        "Primary Button M",
                        disable: true
                    )
                    
                    RDButtonView(
                        .small,
                        .primary,
                        "Primary Button S",
                        disable: true
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Secondary Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .secondary,
                        "Primary Button XL"
                    )
                    
                    RDButtonView(
                        .large,
                        .secondary,
                        "Primary Button L"
                    )
                    
                    RDButtonView(
                        .medium,
                        .secondary,
                        "Primary Button M"
                    )
                    
                    RDButtonView(
                        .small,
                        .secondary,
                        "Primary Button S"
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Secondary Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .secondary,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    RDButtonView(
                        .large,
                        .secondary,
                        "Primary Button L",
                        disable: true
                    )
                    
                    RDButtonView(
                        .medium,
                        .secondary,
                        "Primary Button M",
                        disable: true
                    )
                    
                    RDButtonView(
                        .small,
                        .secondary,
                        "Primary Button S",
                        disable: true
                    )
                }

                VStack(alignment: .leading) {
                    HStack {
                        Text("Tertiary Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .tertiary,
                        "Primary Button XL",
                        icon: ("ic_PlaceholderBlack", "ic_PlaceholderBlack")
                    )
                    
                    RDButtonView(
                        .large,
                        .tertiary,
                        "Primary Button L",
                        icon: ("", "ic_PlaceholderBlack")
                    )
                    
                    RDButtonView(
                        .medium,
                        .tertiary,
                        "Primary Button M",
                        icon: ("ic_PlaceholderBlack", "ic_PlaceholderBlack")
                    )
                    
                    RDButtonView(
                        .small,
                        .tertiary,
                        "Primary Button S",
                        icon: ("ic_PlaceholderBlack", "")
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Tertiary Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .tertiary,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    RDButtonView(
                        .large,
                        .tertiary,
                        "Primary Button L",
                        disable: true
                    )
                    
                    RDButtonView(
                        .medium,
                        .tertiary,
                        "Primary Button M",
                        disable: true
                    )
                    
                    RDButtonView(
                        .small,
                        .tertiary,
                        "Primary Button S",
                        disable: true
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Ghost Active Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .ghost,
                        "Primary Button XL"
                    )
                    
                    RDButtonView(
                        .large,
                        .ghost,
                        "Primary Button L"
                    )
                    
                    RDButtonView(
                        .medium,
                        .ghost,
                        "Primary Button M"
                    )
                    
                    RDButtonView(
                        .small,
                        .ghost,
                        "Primary Button S"
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Ghost Disable Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    RDButtonView(
                        .extraLarge,
                        .ghost,
                        "Primary Button XL",
                        disable: true
                    )
                    
                    RDButtonView(
                        .large,
                        .ghost,
                        "Primary Button L",
                        disable: true
                    )
                    
                    RDButtonView(
                        .medium,
                        .ghost,
                        "Primary Button M",
                        disable: true
                    )
                    
                    RDButtonView(
                        .small,
                        .ghost,
                        "Primary Button S",
                        disable: true
                    )
                }
            }
            .padding()
            .navigationTitle("Button")
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent()
    }
}

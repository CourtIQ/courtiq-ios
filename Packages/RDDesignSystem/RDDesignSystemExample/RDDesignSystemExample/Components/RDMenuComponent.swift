//
//  RDMenuComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 11/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDMenuComponent: View {
    
    let views1: [AnyView] = [
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        ),
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        )
    ]
    
    let views2: [AnyView] = [
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        ),
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        ),
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        )
    ]
    
    
    let views3: [AnyView] = [
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        ),
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        ),
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        ),
        AnyView(
            Button{
                
            } label: {
                Text("Label")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.platinum950)
                
                Image("ic_PlaceholderBlack")
            }
        )
    ]
    
    
    var body: some View {
        List {
            RDMenuView(items: views1, label: AnyView(Text("Open Menu 1")))
            RDMenuView(items: views2, label: AnyView(Text("Open Menu 2")))
            RDMenuView(items: views3, label: AnyView(Text("Open Menu 3")))
        }
        .navigationTitle("Toggle")
    }
}

struct RDMenuComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDMenuComponent()
    }
}

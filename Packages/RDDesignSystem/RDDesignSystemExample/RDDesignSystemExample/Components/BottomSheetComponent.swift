//
//  BottomSheetComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 10/11/2023.
//

import SwiftUI
import RDDesignSystem

struct BottomSheetComponent: View {
    
    @State var presentSheet1 = false
    @State var presentSheet2 = false
    @State var presentSheet3 = false
    @State var presentSheet4 = false
    
    var body: some View {
        List {
            Button {
                presentSheet1.toggle()
            } label: {
                Text("Present Primary Sheet")
            }
            
            Button {
                presentSheet2.toggle()
            } label: {
                Text("Present Secondary Sheet")
            }
            
            Button {
                presentSheet3.toggle()
            } label: {
                Text("Present Tertiary Sheet")
            }
            
            Button {
                presentSheet4.toggle()
            } label: {
                Text("Present Quaternary Sheet")
            }
        }
        .sheet(isPresented: $presentSheet1) {
            RDBottomSheetView(type: .primary, image: "ic_PlaceholderBig", title: "Title", headline: "Headline", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporal invidunt ut labore et dolore.")
                .presentationDetents([.height(410)])
                .presentationCornerRadius(30)
                .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $presentSheet2) {
            RDBottomSheetView(type: .secondary, image: "ic_PlaceholderBig", title: "Title", headline: "Headline", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporal invidunt ut labore et dolore.")
                .presentationDetents([.height(545)])
                .presentationCornerRadius(30)
                .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $presentSheet3) {
            RDBottomSheetView(type: .tertiary, image: "ic_PlaceholderBig", title: "Title", headline: "Headline", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporal invidunt ut labore et dolore.")
                .presentationDetents([.height(480)])
                .presentationCornerRadius(30)
                .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $presentSheet4) {
            RDBottomSheetView(type: .quaternary, image: "ic_PlaceholderBig", title: "Title", headline: "Headline", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporal invidunt ut labore et dolore.")
                .presentationDetents([.height(480)])
                .presentationCornerRadius(30)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct BottomSheetComponent_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetComponent()
    }
}

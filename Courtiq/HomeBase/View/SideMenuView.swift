//
//  SideMenuView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-26.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        let sideMenuWidth = getRect().width * 0.75
        VStack{
            Group {
                Text("Side Menu")
                Spacer()
            }

        }
        .frame(width: sideMenuWidth)
        .background(Color.red)
    }
}

#Preview {
    SideMenuView()
}

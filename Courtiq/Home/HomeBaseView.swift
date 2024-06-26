//
//  NewBaseView.swift
//  Tennis
//
//  Created by Pranav Suri on 23/12/22.
//

import SwiftUI

struct HomeBaseView: View {
    var body: some View {
        HStack {
            SideMenuView()
            HomeTabView()
        }
        
    }
}

struct HomeBaseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBaseView()
    }
}

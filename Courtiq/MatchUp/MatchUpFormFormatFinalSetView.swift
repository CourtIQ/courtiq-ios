//
//  MatchUpFormFormatFinalSetView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-12.
//

import SwiftUI

// MARK: - MatchUpFormFormatFinalSetView

struct MatchUpFormFormatFinalSetView: View {
    
    // MARK: - Lifecycle
    
    init(vm: MatchUpVM) {
        self.vm = vm
    }
    
    // MARK: - Internal
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    // MARK: - Private
    
    @ObservedObject private var vm: MatchUpVM
}

#Preview {
    MatchUpFormFormatFinalSetView(vm: MatchUpVM())
}

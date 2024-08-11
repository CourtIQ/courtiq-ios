//
//  SwiftUIView.swift
//  
//
//  Created by Pranav Suri on 2024-08-10.
//

import SwiftUI

// MARK: - StatCard

public struct StatCard: View {
    
    // MARK: - Enums
    
    enum StatCardType {
        case primary, secondary
    }
    
    // MARK: - Lifecycle
    
    public init(title: String,
                count: Int,
                action: @escaping () -> Void = {},
                icon: Image
    ) {
        self.title = title
        self.count = count
        self.action = action
        self.icon = icon
    }
    // MARK: - Internal
    
    public var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    // MARK: - Private
    
    private var title: String
    private var count: Int
    private var action: () -> Void
    private var icon: Image
    
}

//#Preview {
//    StatCard()
//}

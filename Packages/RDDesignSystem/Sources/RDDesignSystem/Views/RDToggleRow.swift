//
//  RDToggleRow.swift
//  
//
//  Created by Pranav Suri on 2024-08-12.
//

import SwiftUI

// MARK: - RDToggleRow

public struct RDToggleRow: View {
    
    // MARK: - Lifecycle
    
    public init(title: String,
                isOn: Binding<Bool>)
    {
        self.title = title
        self.isOn = isOn
    }
    
    // MARK: - Internal
    
    public var body: some View {
        HStack {
            Text(title)
                .rdBody()
                .foregroundColor(Color.TokenColor.Semantic.Text.primary)
            
            Spacer()
            
            RDToggle(isOn: Binding(get: { isOn.wrappedValue },
                                   set: { isOn.wrappedValue = $0 }))
        }
    }
    
    // MARK: - Private
    
    private var title: String
    private var isOn: Binding<Bool>
}

// MARK: - Previews

#Preview {
    RDToggleRow(title: "Title", isOn: .constant(true))
}

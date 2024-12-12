//
//  SwiftUIView.swift
//  
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

import SwiftUI

struct RDDropdownListView: View {
    var items: [DropdownItem]
    var currentState: RDTextField.RDTextFieldState
    var onSelect: (DropdownItem) -> Void
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(items) { item in
                HStack {
                    item.image
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(item.title)
                        .rdBody()
                        .foregroundColor(currentState.valueColor)
                    Spacer()
                }
                .background(currentState.backgroundColor)
                .onTapGesture {
                    onSelect(item)
                }
                Divider()
            }
        }
        .frame(maxHeight: 80)
    }
}

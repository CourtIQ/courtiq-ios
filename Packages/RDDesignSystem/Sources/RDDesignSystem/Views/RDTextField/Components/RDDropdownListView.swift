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
                        .frame(width: 16, height: 16)
                    Text(item.title)
                        .rdSmallBody()
                        .foregroundColor(currentState.valueColor)
                    Spacer()
                }
                .background(currentState.backgroundColor)
                .onTapGesture {
                    onSelect(item)
                }
                Divider()
                    .padding(0)
            }
        }
        .frame(maxHeight: 120)
    }
}

//
//  RDHelperTextView.swift
//
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

struct RDHelperTextView: View {
    var text: String
    var color: Color
    
    var body: some View {
        HStack {
            Text(text)
                .rdSmallBody()
                .foregroundColor(color)
            Spacer()
        }
    }
}

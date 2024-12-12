//
//  File.swift
//  
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

public struct DropdownItem: Identifiable {
    public var id = UUID()
    public var image: Image
    public var title: String

    public init(id: UUID = UUID(), image: Image, title: String) {
        self.id = id
        self.image = image
        self.title = title
    }
}

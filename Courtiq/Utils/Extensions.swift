//
//  Extensions.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-26.
//

import Foundation
import SwiftUI

extension View {
    func getRect() -> CGRect {
        UIScreen.main.bounds
    }

    func safeArea() -> UIEdgeInsets {
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return null
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return null
        }

        return safeArea
    }
}

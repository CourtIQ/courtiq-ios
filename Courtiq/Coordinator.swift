//
//  Coordinator.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-16.
//

import Foundation
import SwiftUI

enum PresentationType {
    case push
    case modal
    case fullScreen
    case sheet
}

protocol Coordinator: ObservableObject {
    var navigationPath: NavigationPath { get set }
    var sheetView: AnyView? { get set }
    var fullScreenCoverView: AnyView? { get set }

    func start()
    func navigate(to view: AnyView, presentationType: PresentationType)
    func dismiss(presentationType: PresentationType)
}


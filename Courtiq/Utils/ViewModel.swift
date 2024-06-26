//
//  ViewModel.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-26.
//

import Foundation

// MARK: ViewModel

protocol ViewModel: ObservableObject {
    associatedtype Action

    func handle(action: Action)
    func onAppear()
    func onDisappear()
}

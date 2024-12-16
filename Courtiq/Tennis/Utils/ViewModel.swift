//
//  ViewModel.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-26.
//

import Foundation

// MARK: ViewModel

protocol ViewModel: ObservableObject {
    associatedtype Actions

    func handle(action: Actions)
    func onAppear()
    func onDisappear()
}

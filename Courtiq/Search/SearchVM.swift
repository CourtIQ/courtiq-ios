//
//  SearchVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-08.
//


import AuthenticationService
import Foundation
import InstantSearchSwiftUI
import UserService


final class SearchVM: ViewModel {
    
    // MARK: - Internal Properties
    
    let algoliaController = AlgoliaController()
    
    @Published var searchFieldIsEditing: Bool = false
    @Published var searchBoxController: SearchBoxObservableController
    @Published var hitsController: HitsObservableController<User>
    @Published var statsController: StatsTextObservableController
    
    // MARK: - Private Properties
    
    // MARK: - Initializer
    init() {
        self.searchBoxController = algoliaController.searchBoxController
        self.hitsController = algoliaController.hitsController
        self.statsController = algoliaController.statsController
    }
    
    // MARK: - Internal Methods
    
    func handle(action: SearchVM.Actions) {
        switch action {
        case .filterButtonTapped:
            filterButtonTapped()
        case .searchButtonTapped:
            searchButtonTapped()
        }
    }

    func onAppear() {
        // Add your code here.
    }

    func onDisappear() {
        // Add your code here.
    }
    
    // MARK: - Private Methods
    
    private func filterButtonTapped() {
        // Add your code here.
    }
    
    private func searchButtonTapped() {
        // Add your code here.
    }
}

extension SearchVM {
    
    // MARK: Actions
    enum Actions {
        case filterButtonTapped
        case searchButtonTapped
    }
}

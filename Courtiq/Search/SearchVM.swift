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
import SwiftUI


final class SearchVM: ViewModel {
    
    // MARK: - Internal Properties
    
    let algoliaController = AlgoliaController()
    
    @Published var searchFieldIsEditing: Bool = false
    @Published var searchBoxController: SearchBoxObservableController
    @Published var hitsController: HitsObservableController<User>
    @Published var statsController: StatsTextObservableController
    
    // MARK: - Private Properties
    
    private var router: AppRouter
    
    // MARK: - Initializer
    init(router: AppRouter) {
        self.router = router
        self.searchBoxController = algoliaController.searchBoxController
        self.hitsController = algoliaController.hitsController
        self.statsController = algoliaController.statsController
    }
    
    // MARK: - Internal Methods
    
    @MainActor func handle(action: SearchVM.Actions) {
        switch action {
        case .filterButtonTapped:
            filterButtonTapped()
        case .searchButtonTapped:
            searchButtonTapped()
        case .userSearchItemTapped(let user):
            searchItemTapped(user: user)
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
    
    @MainActor private func searchItemTapped(user: User) {
        let view = SearchProfileDetailView(user: user)
        router.handle(action: .push(AnyView(view)))
    }
}

extension SearchVM {
    
    // MARK: Actions
    enum Actions {
        case filterButtonTapped
        case searchButtonTapped
        case userSearchItemTapped(user: User)
    }
}

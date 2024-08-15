//
//  SearchVM.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-08.
//


import AuthenticationService
import Foundation
import InstantSearchSwiftUI
import RelationshipService
import SwiftUI
import UserService


final class SearchVM: ViewModel {
    
    // MARK: - Internal Properties
    
    let algoliaController = AlgoliaController()
    
    @Published var searchFieldIsEditing: Bool = false
    @Published var searchBoxController: SearchBoxObservableController
    @Published var hitsController: HitsObservableController<User>
    @Published var statsController: StatsTextObservableController
    
    // MARK: - Private Properties
    
    private var router: AppRouter
    private var userService: any UserServiceProtocol
    private var relationsService: any RelationshipServiceProtocol
    
    
    // MARK: - Initializer
    init(router: AppRouter,
         userService: any UserServiceProtocol,
         relationsService: any RelationshipServiceProtocol)
    {
        self.router = router
        self.userService = userService
        self.relationsService = relationsService
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
        let view = SearchProfileDetailView(user: user,
                                           relationsService: relationsService as! RelationshipService)
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

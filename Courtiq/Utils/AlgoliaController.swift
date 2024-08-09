//
//  AlgoliaController.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-08-08.
//

import Foundation
import InstantSearchSwiftUI
import InstantSearchCore
import UIKit
import UserService

class AlgoliaController: ObservableObject {
    
    let searcher: HitsSearcher
    
    let searchBoxInteractor: SearchBoxInteractor
    var searchBoxController: SearchBoxObservableController
    
    let hitsInteractor: HitsInteractor<User>
    let hitsController: HitsObservableController<User>
    
    let statsInteractor: StatsInteractor
    let statsController: StatsTextObservableController
    
    init() {
        self.searcher = HitsSearcher(appID: "8PDOSTKXCB",
                                     apiKey: "b09dabc7f23316f3402ffa409e7f98fe",
                                     indexName: "users")
        self.searchBoxInteractor = .init()
        self.searchBoxController = .init()
        self.hitsInteractor = .init()
        self.hitsController = .init()
        self.statsInteractor = .init()
        self.statsController = .init()
        setupConnections()
    }
    
    func setupConnections() {
        searchBoxInteractor.connectSearcher(searcher, searchTriggeringMode: .searchOnSubmit)
        searchBoxInteractor.connectController(searchBoxController)
        hitsInteractor.connectSearcher(searcher)
        hitsInteractor.connectController(hitsController)
        statsInteractor.connectSearcher(searcher)
        statsInteractor.connectController(statsController)
    }
    
}

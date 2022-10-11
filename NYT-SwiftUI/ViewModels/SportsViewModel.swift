//
//  SportsViewModel.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 11/10/2022.
//

import Foundation

class SportsViewModel: ObservableObject {
    
    @Published var newsList: [News] = []
    
    var isLoadingList: Bool = false
    var isAllDataLoaded: Bool = false
    
    init() {
        fetchData()
    }
    
    //MARK: - GETTERS
    func getNewsListCount() -> Int {
        return newsList.count
    }
    
    func getNewsArticles() -> [News] {
        return newsList
    }
}

//MARK: - API CALL

extension SportsViewModel {
    func fetchData() {
        NetworkLayer.getSports() {
            results, isAllDataLoaded in
            self.isAllDataLoaded = isAllDataLoaded
            if let results = results {
                self.newsList = results
            }
        }
    }
}

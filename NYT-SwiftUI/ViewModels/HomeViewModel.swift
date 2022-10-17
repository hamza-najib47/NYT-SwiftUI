//
//  HomeViewModel.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 05/10/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    
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

extension HomeViewModel {
    func fetchData() {
        NetworkLayer.getHome() {
            results, isAllDataLoaded in
            self.isAllDataLoaded = isAllDataLoaded
            if let results = results {
                self.newsList = results
            }
        }
    }
}

//MARK: - Favourites Delegate

extension HomeViewModel: FavouritesCellDelegate {
    func favActionBtn(_ article: News, _ isFavourite: Bool) {
        if isFavourite {
            var newsArticle = article
            newsArticle.isFavourite = true
            NetworkLayer.insertIntoDatabase(newsArticle)
        }
        else {
            NetworkLayer.removeFromDatabase(article)
        }
    }
}

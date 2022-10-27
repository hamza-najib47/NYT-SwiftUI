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
            if var results = results {
                var checker: Int? = nil
                for index in results.indices {
                    results[index].isFavourite = false
                    if results[index].abstract == Constants.Keys.empty {
                        checker = index
                    }
                }
                if let checker = checker {
                    results.remove(at: checker)
                }
                FavouritesViewModel.provideFavouritesData {
                    favouriteArticles in
                    if let newsArticles = favouriteArticles {
                        for article in newsArticles {
                            if let index = results.firstIndex(of: article) {
                                results[index].isFavourite = true
                            }
                        }
                    }
                    self.newsList = results
                }
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

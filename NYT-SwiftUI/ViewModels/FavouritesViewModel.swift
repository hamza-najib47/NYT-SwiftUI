//
//  FavouritesViewModel.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 14/10/2022.
//

import Foundation

class FavouritesViewModel: ObservableObject {
    @Published var newsList: [News] = []
    
    var isLoadingList: Bool = false
    var isAllDataLoaded: Bool = false
    
    init() {
        getData()
    }
    
    //MARK: - GETTERS
    func getNewsListCount() -> Int {
        return newsList.count
    }
    
    func getNewsArticles() -> [News] {
        return newsList
    }
}

//MARK: - Firebase Management

extension FavouritesViewModel: FavouritesCellDelegate {
    
    func getData() {
        NetworkLayer.getAllDataFromDatabase {
            newsArticles, isDataLoaded in
            self.isAllDataLoaded = isDataLoaded
            if let newsArticles = newsArticles {
                self.newsList = newsArticles
            }
        }
    }
    
    func favActionBtn(_ article: News, _ isFavourite: Bool) {
        if !isFavourite {
            NetworkLayer.removeFromDatabase(article)
        }
    }
}

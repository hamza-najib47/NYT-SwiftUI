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
            if(isDataLoaded == false) {
                self.newsList = []
                return
            }
            if var newsArticles = newsArticles {
                newsArticles.sort(by: {$0.created_date! > $1.created_date!})
                for var article in newsArticles {
                    article.isFavourite = true
                }
                self.newsList = newsArticles
            }
        }
    }
    
    func favActionBtn(_ article: News, _ isFavourite: Bool) {
        if !isFavourite {
            NetworkLayer.removeFromDatabase(article)
        }
    }
    
    static func provideFavouritesData(completionHandler completion: @escaping ([News]?) -> Void) {
        NetworkLayer.getAllDataFromDatabase {
            newsArticles, isDataLoaded in
            if isDataLoaded == false {
                completion(nil)
                return
            }
            if let newsArticles = newsArticles {
                for var article in newsArticles {
                    article.isFavourite = true
                }
                completion(newsArticles)
            }
        }
    }
}

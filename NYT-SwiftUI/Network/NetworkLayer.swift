//
//  NetworkLayer.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 05/10/2022.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseSharedSwift

class NetworkLayer {
    
    static var firebaseRef: DatabaseReference! = Database.database(url: Constants.URLS.firebaseURL).reference()
}
    //MARK: - Fetch Data Through API
 
extension NetworkLayer {
    private static func getData(_ newsType: String, completionHandler completion: @escaping ([News]?, Bool) -> Void) {
        
        let session = URLSession.shared
        let home = Constants.URLS.initialUrl + newsType + Constants.URLS.urlInterval + Constants.Keys.apiKey
        guard let url = URL(string: home)
        else {
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if(error != nil) {
                return
            }
            else {
                let newsArticles = try? JSONDecoder().decode(NewsArr.self, from: data!)
                completion(newsArticles?.results, true)
            }
        }
        task.resume()
    }
    
    static func getHome(completionHandler completion: @escaping ([News]?, Bool) -> Void) {
        getData(Constants.NewsTypesForURL.home) {
            newsList, isAlldataLoaded in
            DispatchQueue.main.async {
                completion(newsList, isAlldataLoaded)
            }
        }
    }
    
    static func getSports(completionHandler completion: @escaping ([News]?, Bool) -> Void) {
        getData(Constants.NewsTypesForURL.sports) {
            newsList, isAlldataLoaded in
            DispatchQueue.main.async {
                completion(newsList, isAlldataLoaded)
            }
        }
    }
    
    static func getScience(completionHandler completion: @escaping ([News]?, Bool) -> Void) {
        getData(Constants.NewsTypesForURL.science) {
            newsList, isAlldataLoaded in
            DispatchQueue.main.async {
                completion(newsList, isAlldataLoaded)
            }
        }
    }
}

//MARK: - Firebase Management

extension NetworkLayer {
    
    static func getAllDataFromDatabase(completionHandler completion: @escaping ([News]?, Bool) -> Void) {
        firebaseRef.getData {
            error, snapshot in
            var newsList: [News] = []
            if let data = snapshot?.value as? [String: Any] {
                for (_, item) in data {
                    let article = try? FirebaseDataDecoder().decode(News.self, from: item)
                    if let article = article {
                        newsList.append(article)
                    }
                }
                completion(newsList, true)
                return
            }
            completion(nil, false)
        }
    }
    
    static func insertIntoDatabase(_ newsArticle: News) {
        let data = try? JSONEncoder().encode(newsArticle)
        if let data = data {
            let json = try? JSONSerialization.jsonObject(with: data)
            firebaseRef.childByAutoId().setValue(json)
        }
    }
    
    static func removeFromDatabase(_ newsArticle: News) {
        firebaseRef.getData {
            error, snapshot in
            var key: String?
            let newsList = snapshot?.value as? [String: Any]
            if let newsList = newsList {
                for item in newsList {
                    let article = item.value as? [String: Any]
                    if let article = article {
                        let currentArticle = try? FirebaseDataDecoder().decode(News.self, from: article)
                        if currentArticle?.title == newsArticle.title {
                            key = item.key
                        }
                    }
                }
            }
            if let key = key {
                firebaseRef.child(key).removeValue()
            }
        }
    }
}

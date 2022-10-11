//
//  NetworkLayer.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 05/10/2022.
//

import Foundation
import UIKit

class NetworkLayer {
    
    //MARK: - Fetch Data Through API
    
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
}

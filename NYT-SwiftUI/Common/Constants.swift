//
//  Constants.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import Foundation

enum Constants {
    
    enum URLS {
        static let initialUrl = "https://api.nytimes.com/svc/topstories/v2/"
        static let urlInterval = ".json?api-key="
        static let checkOutURLText = "Click here to find out more about this article."
        static let firebaseURL = "https://nyt-swiftui-default-rtdb.asia-southeast1.firebasedatabase.app/"
    }
    
    enum Keys {
        static let apiKey = "0UTU7hkw1B1qmNYF6lhju66W1JjtnZ44"
        static let url = "url"
        static let title = "title"
        static let createdDate = "created_date"
        static let abstract = "abstract"
        static let multimedia = "multimedia"
        static let byline = "byline"
        static let caption = "caption"
        static let detailSegue = "showDetailedView"
        static let results = "results"
        static let isFav = "isFavourite"
        static let refresh = "Pull to refresh"
    }
    
    enum NewsTypesForURL {
        static let home = "home"
        static let sports = "sports"
        static let science = "science"
    }
    
    enum NewsTypes {
        static let home = "Home"
        static let sports = "Sports"
        static let science = "Science"
        static let favourites = "Favourites"
    }
    
    enum LogoImages {
        static let home = "homekit"
        static let sports = "sportscourt"
        static let science = "newspaper"
        static let notFavourite = "star"
        static let isFavourite = "star.fill"
    }
    
    enum Errors {
        static let imageError = "From catch block: Image could not be downloaded !!"
    }
    
    enum articleReplacements {
        static let abstract = "No Abstract"
        static let byline = "By: Unknown"
        static let checkout = "Please check more out at: "
        static let url = "No URL Given"
        static let title = "No Title"
    }
}

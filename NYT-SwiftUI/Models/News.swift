//
//  News.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 05/10/2022.
//

import Foundation

struct NewsArr: Codable {
    var results: [News]?
}

struct News: Codable {
    
    var abstract: String?
    var byline: String?
    var created_date: String?
    var title: String?
    var url: String?
    var multimedia: [Media]?
    var isFavourite: Bool? = false
    
    static func ==(left: News, right: News) -> Bool {
        return left.abstract == right.abstract
    }
}

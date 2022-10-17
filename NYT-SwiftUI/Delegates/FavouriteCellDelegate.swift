//
//  FavouriteCellDelegate.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 14/10/2022.
//

import Foundation

protocol FavouritesCellDelegate: AnyObject {
    func favActionBtn(_ article: News, _ isFavourite: Bool)
}

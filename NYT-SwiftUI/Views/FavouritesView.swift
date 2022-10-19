//
//  FavouritesView.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var favouritesViewModel: FavouritesViewModel = FavouritesViewModel()
    
    var body: some View {
        NavigationView {
            List(favouritesViewModel.newsList, id: \.title) {
                article in
                NavigationLink {
                    DetailedView(newsArticle: article)
                } label: {
                    NewsArticleTableCell(newsArticle: article, isFavouritePressed: true, delegate: favouritesViewModel)
                }
            }
            .refreshable {
                favouritesViewModel.getData()
            }
            .listStyle(.plain)
        }
        .onAppear {
            favouritesViewModel.getData()
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}

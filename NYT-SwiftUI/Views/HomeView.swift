//
//  HomeView.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List(homeViewModel.newsList, id: \.title) {
                article in
                NavigationLink {
                    DetailedView(newsArticle: article)
                } label: {
                    NewsArticleTableCell(newsArticle: article, delegate: homeViewModel)
                }
            }
            .refreshable { }
            .listStyle(.plain)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

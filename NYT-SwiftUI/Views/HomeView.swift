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
        
        List(homeViewModel.newsList, id: \.title) {
            article in
            NewsArticleTableCell(newsArticle: article)
        }
        .refreshable { }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

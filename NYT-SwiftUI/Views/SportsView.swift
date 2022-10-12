//
//  SportsView.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

struct SportsView: View {
    @ObservedObject var sportsViewModel: SportsViewModel = SportsViewModel()
    
    var body: some View {
        NavigationView {
            List(sportsViewModel.newsList, id: \.title) {
                article in
                NavigationLink {
                    DetailedView(newsArticle: article)
                } label: {
                    NewsArticleTableCell(newsArticle: article)
                }
            }
            .refreshable { }
            .listStyle(.plain)
        }
    }
}

struct SportsView_Previews: PreviewProvider {
    static var previews: some View {
        SportsView()
    }
}

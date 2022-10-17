//
//  ScienceView.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

struct ScienceView: View {
    @ObservedObject var scienceViewModel: ScienceViewModel = ScienceViewModel()
    
    var body: some View {
        NavigationView {
            List(scienceViewModel.newsList, id: \.title) {
                article in
                NavigationLink {
                    DetailedView(newsArticle: article)
                } label: {
                    NewsArticleTableCell(newsArticle: article, delegate: scienceViewModel)
                }
            }
            .refreshable { }
            .listStyle(.plain)
        }
    }
}

struct ScienceView_Previews: PreviewProvider {
    static var previews: some View {
        ScienceView()
    }
}

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
        
        List(sportsViewModel.newsList, id: \.title) {
            article in
            NewsArticleTableCell(newsArticle: article)
        }
        .refreshable { }
    }
}

struct SportsView_Previews: PreviewProvider {
    static var previews: some View {
        SportsView()
    }
}

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
        
        List(scienceViewModel.newsList, id: \.title) {
            article in
            NewsArticleTableCell(newsArticle: article)
        }
        .refreshable { }
    }
}

struct ScienceView_Previews: PreviewProvider {
    static var previews: some View {
        ScienceView()
    }
}

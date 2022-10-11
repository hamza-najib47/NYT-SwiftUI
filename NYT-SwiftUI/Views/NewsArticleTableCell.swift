//
//  NewsArticleTableCell.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

struct NewsArticleTableCell: View {
    
    var newsArticle: News
    
    var body: some View {

        let abstractLbl = Text(newsArticle.abstract ?? Constants.articleReplacements.abstract)
            .lineLimit(2)
        let bylineLbl = Text(newsArticle.byline ?? Constants.articleReplacements.byline)
            .foregroundColor(.gray)
            .font(.system(size: 15))
            .lineLimit(1)
        let isFavouriteImg = Image(systemName: Constants.LogoImages.favourites)
            .foregroundColor(.yellow)
        
        HStack {
            if let multimedia = newsArticle.multimedia,
               let url = multimedia[2].url {
                AsyncImage(url: URL(string: url)) {
                    image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            }
            VStack {
                abstractLbl
                HStack {
                    bylineLbl
                    Spacer()
                    isFavouriteImg
                }
            }
        }
        .padding()
    }
}

struct NewsArticleTableCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleTableCell(newsArticle: News())
    }
}

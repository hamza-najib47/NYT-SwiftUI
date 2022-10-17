//
//  NewsArticleTableCell.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

struct NewsArticleTableCell: View {
    
    var newsArticle: News
    @State private var isFavouritePressed = false
    weak var delegate: FavouritesCellDelegate?
    
    var body: some View {

        let abstractLbl = Text(newsArticle.abstract ?? Constants.articleReplacements.abstract)
            .lineLimit(2)
        let bylineLbl = Text(newsArticle.byline ?? Constants.articleReplacements.byline)
            .foregroundColor(.gray)
            .font(.system(size: 15))
            .lineLimit(1)
        let isFavouriteBtn =
        Button(action: {
            isFavouritePressed = !isFavouritePressed
            if isFavouritePressed {
                delegate?.favActionBtn(newsArticle, true)
            }
            else {
                delegate?.favActionBtn(newsArticle, false)
            }
        }, label: {
            if isFavouritePressed {
                Image(systemName: Constants.LogoImages.isFavourite)
                    .foregroundColor(.yellow)
            }
            else {
                Image(systemName: Constants.LogoImages.notFavourite)
                    .foregroundColor(.yellow)
            }
        })
        .buttonStyle(.plain)
        
        
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
                    isFavouriteBtn
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

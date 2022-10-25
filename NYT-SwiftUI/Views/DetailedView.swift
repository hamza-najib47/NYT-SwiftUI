//
//  DetailedView.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 12/10/2022.
//

import SwiftUI

struct DetailedView: View {
    var newsArticle: News
    
    var body: some View {
        VStack {
            Text(newsArticle.abstract ?? Constants.articleReplacements.abstract)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(4)
                .padding()
            if let multimedia = newsArticle.multimedia,
               let url = multimedia[1].url {
                AsyncImage(url: URL(string: url)) {
                    image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .fixedSize(horizontal: true, vertical: true)
                .padding()
            }
            HStack {
                Text(Constants.articleReplacements.checkout)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text(newsArticle.url ?? Constants.articleReplacements.url)
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
                    .lineLimit(2)
                Spacer()
            }
            Spacer()
        }
        .navigationViewStyle(.stack)
        .navigationTitle(newsArticle.title ?? Constants.articleReplacements.title)
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(newsArticle: News())
    }
}

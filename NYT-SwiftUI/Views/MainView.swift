//
//  MainView.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(Constants.NewsTypes.home, systemImage: Constants.LogoImages.home)
                }
            SportsView()
                .tabItem {
                    Label(Constants.NewsTypes.sports, systemImage: Constants.LogoImages.sports)
                }
            ScienceView()
                .tabItem {
                    Label(Constants.NewsTypes.science, systemImage: Constants.LogoImages.science)
                }
            FavouritesView()
                .tabItem {
                    Label(Constants.NewsTypes.favourites, systemImage: Constants.LogoImages.favourites)
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

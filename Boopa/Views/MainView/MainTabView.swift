//
//  MainTabView.swift
//  Boopa
//
//  Created by Aleksandr on 28.06.2025.
//

// MainTabView.swift
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            AddView()
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Add")
                }

            ReelsView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Reels")
                }

            ProfileView(userID: "u1")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

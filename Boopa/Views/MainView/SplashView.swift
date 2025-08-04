//
//  SplashView.swift
//  Boopa
//
//  Created by Aleksandr on 28.06.2025.
//

// SplashView.swift
import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        Group {
            if isActive {
                MainTabView()
            } else {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 0.988, green: 0.325, blue: 0.643), location: 0.0), // розово-пурпурный
                            .init(color: Color(red: 0.529, green: 0.235, blue: 0.827), location: 0.5),  // фиолетовый
                            .init(color: Color(red: 0.141, green: 0.392, blue: 0.949), location: 1.0)   // синий
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    Image("BoopaLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

//
//  VideoSkeletonView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/VideoSkeletonView.swift
import SwiftUI

struct VideoSkeletonView: View {
    var body: some View {
        Color.black.ignoresSafeArea()
            .overlay(
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            )
    }
}

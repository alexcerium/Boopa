//
//  StoryPagerView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/StoryPagerView.swift
import SwiftUI

struct StoryPagerView: View {
    let stories: [Story]
    @State private var index: Int
    @Environment(\.dismiss) private var dismiss

    init(stories: [Story], startIndex: Int) {
        self.stories = stories
        _index = State(initialValue: startIndex)
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabView(selection: $index) {
                ForEach(Array(stories.enumerated()), id: \.element.id) { idx, story in
                    Image(story.imageName)
                        .resizable()
                        .scaledToFit()
                        .tag(idx)
                        .ignoresSafeArea()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .background(Color.black.ignoresSafeArea())

            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

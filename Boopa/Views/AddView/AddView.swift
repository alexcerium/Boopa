//
//  AddView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/AddView.swift
import SwiftUI
import PhotosUI

struct AddView: View {
    enum PublishType: String, CaseIterable {
        case post = "Post"
        case story = "Story"
        case video = "Video"
    }

    @State private var selectedType: PublishType = .post
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Большая превью картинка
                if let data = imageData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipped()
                } else {
                    Color(.systemGray5)
                        .frame(height: 300)
                }

                // Instagram-style segmented control
                HStack(spacing: 0) {
                    ForEach(PublishType.allCases, id: \.self) { type in
                        Button {
                            selectedType = type
                        } label: {
                            Text(type.rawValue.uppercased())
                                .font(.subheadline).bold()
                                .foregroundColor(selectedType == type ? .black : .gray)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        }
                    }
                }
                .padding(4)
                .background(Color(.systemGray5))
                .clipShape(Capsule())
                .padding(.horizontal)

                // Photo picker grid preview
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        // Camera tile
                        ZStack {
                            Color(.systemGray6)
                            Image(systemName: "camera.fill")
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)

                        if let data = imageData, let uiImage = UIImage(data: data) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipped()
                                .cornerRadius(8)
                        } else {
                            ForEach(0..<4) { _ in
                                Color(.systemGray6)
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)

                // PhotosPicker button
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("Select from Library")
                        .font(.body).bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                        .padding(.horizontal)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            imageData = data
                        }
                    }
                }

                Spacer()
            }
            .navigationTitle("New Post")
            .background(Color.white.ignoresSafeArea())
        }
    }
}

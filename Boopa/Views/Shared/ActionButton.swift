//
//  ActionButton.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/ActionButton.swift
import SwiftUI

struct ActionButton: View {
    let systemName: String
    @Binding var isActive: Bool
    let action: () -> Void

    @State private var animate = false

    init(systemName: String,
         isActive: Binding<Bool> = .constant(false),
         action: @escaping () -> Void = {}) {
        self.systemName = systemName
        self._isActive = isActive
        self.action = action
    }

    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isActive.toggle()
                animate = true
            }
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animate = false
            }
        } label: {
            Image(systemName: isActive ? "\(systemName).fill" : systemName)
                .font(.title2)
                .scaleEffect(animate ? 1.3 : 1)
        }
    }
}

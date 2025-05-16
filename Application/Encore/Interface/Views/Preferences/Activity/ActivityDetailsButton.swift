//
//  ActivityDetailsButton.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import SwiftUI

internal struct ActivityDetailsButton: View {
    internal let title: String
    internal let url: URL

    internal var body: some View {
        Button(self.title) {
            NSWorkspace.shared.open(self.url)
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, minHeight: 30)
        .font(.custom(UI.kActivityFontFamilyText, size: UI.kActivityTextSizeText))
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.secondary.opacity(0.4), lineWidth: 0.5)
        )
    }
}

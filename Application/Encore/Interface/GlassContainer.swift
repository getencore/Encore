//
//  SectionView.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import SwiftUI
import UniversalGlass

internal struct GlassContainer<Content: View>: View {
    @ViewBuilder internal let content: Content

    internal var body: some View {
        content
            .padding(EncoreApp.kItemSpacing)
            .universalGlassEffect(in: RoundedRectangle(cornerRadius: 16))
    }
}

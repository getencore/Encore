//
//  ActivityDetailsView.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCoreBridge
import SwiftUI

internal struct ActivityDetailsView: View {
    @ObservedObject internal var bridge: EncoreCoreBridge

    internal var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ActivityTextView(text: self.bridge.title ?? "", size: UI.kActivityTextSizeTitle, isBold: true)
            ActivityTextView(text: self.bridge.subtitle ?? "", size: UI.kActivityTextSizeText, isBold: false)
            ActivityTextView(text: self.bridge.details ?? "", size: UI.kActivityTextSizeText, isBold: false)
            ActivityDetailsProgressView(bridge: self.bridge)
                .padding(.top, 4)
                .padding(.bottom, 8)
            let queryParameterRaw: String = "\(self.bridge.title ?? "") \(self.bridge.subtitle ?? "") \(self.bridge.details ?? "")"
            let queryParameter: String = queryParameterRaw.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            ActivityDetailsButton(title: "Search on Apple Music", url: URL(string: "https://music.apple.com/search?term=\(queryParameter)")!)
        }
    }
}

private struct ActivityTextView: View {
    internal let text: String
    internal let size: CGFloat
    internal let isBold: Bool

    internal var body: some View {
        Text(self.text)
            .font(.custom(UI.kActivityFontFamilyText, size: self.size))
            .fontWeight(self.isBold ? .bold : .regular)
            .lineLimit(1)
    }
}

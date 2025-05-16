//
//  PreferencesView.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCoreBridge
import SwiftUI

internal struct ActivityView: View {
    @ObservedObject internal var bridge: EncoreCoreBridge

    internal var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let _: String = self.bridge.applicationBundleIdentifier {
                Text("PREFERENCES_TAB_ACTIVITIES_PREVIEW_LISTENING_TO".localizedWithEnglishFallback("Apple Music"))
                    .font(.custom(UI.kActivityFontFamilyText, size: UI.kActivityTextSizeText))

                HStack(alignment: .top, spacing: 0) {
                    ActivityDetailsCoverView(bridge: self.bridge)
                        .frame(width: UI.kActivityArtworkWidth, height: UI.kActivityArtworkHeight)
                        .padding(.trailing, UI.kItemSpacing)
                    ActivityDetailsView(bridge: self.bridge)
                        .padding(.top, -4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, UI.kItemSpacing)
            } else {
                Text("PREFERENCES_TAB_ACTIVITIES_PREVIEW_NOT_PLAYING".localizedWithEnglishFallback())
                    .font(.custom(UI.kActivityFontFamilyText, size: UI.kActivityTextSizeText))
                    .foregroundStyle(.secondary)

                RoundedRectangle(cornerRadius: 8)
                    .fill(.secondary.opacity(0.15))
                    .frame(maxWidth: .infinity)
                    .frame(height: UI.kActivityArtworkHeight)
                    .padding(.top, UI.kItemSpacing)
                    .overlay(alignment: .center) {
                        Image(systemName: "music.note")
                            .font(.system(size: 28))
                            .foregroundStyle(.secondary.opacity(0.5))
                            .padding(.top, UI.kItemSpacing)
                    }
            }
        }
    }
}

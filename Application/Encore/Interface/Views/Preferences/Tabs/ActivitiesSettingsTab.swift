//
//  ActivitiesSettingsTab.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCoreBridge
import SwiftUI
import UniversalGlass

internal struct ActivitiesSettingsTab: View {
    internal var bridge: EncoreCoreBridge

    internal var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: UI.kItemSpacing) {
                ActivityView(bridge: bridge)
                    .padding(UI.kItemSpacing)
                    .universalGlassEffect(in: RoundedRectangle(cornerRadius: 12))

                Text("PREFERENCES_TAB_ACTIVITIES_PREVIEW_DESCRIPTION".localizedWithEnglishFallback(Bundle.main.bundleName ?? ""))
                    .font(.system(size: 11))
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 4)
            }
            .padding(UI.kScreenSpacing / 2)
        }
        .navigationTitle("PREFERENCES_TAB_ACTIVITIES".localizedWithEnglishFallback())
    }
}

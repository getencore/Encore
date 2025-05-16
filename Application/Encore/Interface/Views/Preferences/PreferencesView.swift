//
//  PreferencesView.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCoreBridge
import SwiftUI

internal enum PreferencesTab: Hashable {
    case about, activities, general
}

internal final class PreferencesState: ObservableObject {
    @Published var selectedTab: PreferencesTab? = .activities
}

internal struct PreferencesView: View {
    @ObservedObject internal var bridge: EncoreCoreBridge
    @ObservedObject internal var state: PreferencesState

    internal var body: some View {
        NavigationSplitView {
            List(selection: $state.selectedTab) {
                Section {
                    Label("PREFERENCES_TAB_GENERAL".localizedWithEnglishFallback(), systemImage: "gear")
                        .tag(PreferencesTab.general)
                    Label("PREFERENCES_TAB_ACTIVITIES".localizedWithEnglishFallback(), systemImage: "music.note")
                        .tag(PreferencesTab.activities)
                }

                Section {
                    Label("PREFERENCES_TAB_ABOUT".localizedWithEnglishFallback(), systemImage: "info.circle")
                        .tag(PreferencesTab.about)
                }
            }
            .navigationSplitViewColumnWidth(min: 150, ideal: 150, max: 150)
        } detail: {
            switch state.selectedTab ?? .activities {
                case .about: AboutSettingsTab()
                case .activities: ActivitiesSettingsTab(bridge: bridge)
                case .general: GeneralSettingsTab()
            }
        }
        .frame(width: 620, height: 450)
    }
}

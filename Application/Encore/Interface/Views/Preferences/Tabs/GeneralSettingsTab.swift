//
//  GeneralSettingsTab.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCore
import ServiceManagement
import SwiftUI
import UniversalGlass

internal struct GeneralSettingsTab: View {
    @AppStorage("isCachingEnabled") private var isCachingEnabled: Bool = true
    @AppStorage("isLoggingEnabled") private var isLoggingEnabled: Bool = false
    @State private var launchAtLogin: Bool = SMAppService.mainApp.status == .enabled

    internal var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: UI.kItemSpacing) {
                VStack(spacing: 0) {
                    HStack {
                        Text("PREFERENCES_TAB_GENERAL_ENABLE_LAUNCH_AT_LOGIN".localizedWithEnglishFallback())

                        Spacer()

                        Toggle("", isOn: Binding(
                            get: { launchAtLogin },
                            set: { enabled in
                                if enabled {
                                    try? SMAppService.mainApp.register()
                                } else {
                                    try? SMAppService.mainApp.unregister()
                                }
                                launchAtLogin = SMAppService.mainApp.status == .enabled
                            }
                        ))
                        .toggleStyle(.switch)
                        .controlSize(.small)
                        .labelsHidden()
                    }
                    .padding(UI.kItemSpacing)

                    Divider()

                    VStack(alignment: .leading, spacing: UI.kItemSpacing) {
                        HStack {
                            Text("PREFERENCES_TAB_GENERAL_ENABLE_CACHING".localizedWithEnglishFallback())

                            Spacer()

                            Toggle("", isOn: $isCachingEnabled)
                                .toggleStyle(.switch)
                                .controlSize(.small)
                                .labelsHidden()
                        }

                        Text("PREFERENCES_TAB_GENERAL_ENABLE_CACHING_DESCRIPTION".localizedWithEnglishFallback())
                            .font(.system(size: 11))
                            .foregroundStyle(.secondary)
                    }
                    .padding(UI.kItemSpacing)
                }
                .universalGlassEffect(in: RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading, spacing: UI.kItemSpacing) {
                    HStack {
                        Text("PREFERENCES_TAB_GENERAL_ENABLE_LOGGING".localizedWithEnglishFallback())

                        Spacer()

                        Toggle("", isOn: $isLoggingEnabled)
                            .toggleStyle(.switch)
                            .controlSize(.small)
                            .labelsHidden()
                    }

                    Text("PREFERENCES_TAB_GENERAL_ENABLE_LOGGING_DESCRIPTION".localizedWithEnglishFallback())
                        .font(.system(size: 11))
                        .foregroundStyle(.secondary)

                    Button("PREFERENCES_TAB_GENERAL_OPEN_LOGS_FOLDER".localizedWithEnglishFallback()) {
                        Logger.sharedInstance().ensureFileSystem()
                        NSWorkspace.shared.open(URL(fileURLWithPath: Logger.sharedInstance().logsPath()))
                    }
                }
                .padding(UI.kItemSpacing)
                .universalGlassEffect(in: RoundedRectangle(cornerRadius: 12))
            }
            .padding(UI.kScreenSpacing / 2)
        }
        .navigationTitle("PREFERENCES_TAB_GENERAL".localizedWithEnglishFallback())
    }
}

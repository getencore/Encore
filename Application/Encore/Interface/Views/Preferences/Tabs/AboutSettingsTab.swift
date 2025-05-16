//
//  AboutSettingsTab.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import SwiftUI
import UniversalGlass

internal struct AboutSettingsTab: View {
    internal var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: UI.kItemSpacing) {
                VStack(spacing: UI.kItemSpacing) {
                    if let appIcon = NSImage(named: NSImage.applicationIconName) {
                        Image(nsImage: appIcon)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }

                    VStack(spacing: 4) {
                        Text(Bundle.main.bundleName ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Text("PREFERENCES_TAB_ABOUT_VERSION".localizedWithEnglishFallback(Bundle.main.bundleVersion ?? ""))
                            .font(.system(size: 12))
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(UI.kItemSpacing)
                .universalGlassEffect(in: RoundedRectangle(cornerRadius: 12))

                VStack(spacing: 0) {
                    Link(destination: URL(string: "https://github.com/getencore/Encore")!) {
                        HStack {
                            Label("PREFERENCES_TAB_ABOUT_SOURCE_CODE".localizedWithEnglishFallback(), systemImage: "curlybraces")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .foregroundStyle(.secondary)
                                .font(.system(size: 11))
                        }
                        .padding(UI.kItemSpacing)
                    }
                    .buttonStyle(.plain)

                    Divider()

                    Link(destination: URL(string: "https://github.com/getencore/Encore/issues")!) {
                        HStack {
                            Label("PREFERENCES_TAB_ABOUT_REPORT_AN_ISSUE".localizedWithEnglishFallback(), systemImage: "exclamationmark.bubble")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .foregroundStyle(.secondary)
                                .font(.system(size: 11))
                        }
                        .padding(UI.kItemSpacing)
                    }
                    .buttonStyle(.plain)
                }
                .universalGlassEffect(in: RoundedRectangle(cornerRadius: 12))

                let currentYear: String = String(Calendar(identifier: .gregorian).component(.year, from: .now))
                Text("PREFERENCES_TAB_ABOUT_COPYRIGHT".localizedWithEnglishFallback(Bundle.main.bundleName ?? "", currentYear))
                    .font(.system(size: 11))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(UI.kScreenSpacing / 2)
        }
        .navigationTitle("PREFERENCES_TAB_ABOUT".localizedWithEnglishFallback())
    }
}

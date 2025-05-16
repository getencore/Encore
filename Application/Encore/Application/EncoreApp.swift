//
//  EncoreApp.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCoreBridge
import SwiftUI

// TODO: rewrite the preferences panel (add licenses, extract common coden fix the progress color, fix "Publishing changes from within view updates is not allowed, this will cause undefined behavior.")
// TODO: implement disable caching
// TODO: implement disable logging
// TODO: preferences (presets [local, cloud, custom {detect currently playing app} | use localized or custom name for preset | type {song, content or game} | what to display on the status | custom search api button], show odesli button, cover provider [itunes, encore] {}, use data from the app id [top title and appicon])
// TODO: implement sparkle
// TODO: add website support

// TODO: app icon & menu bar icon
// TODO: add documentation

@main
internal struct EncoreApp: App {
    private let bridge: EncoreCoreBridge = .init()
    private let preferencesState: PreferencesState = .init()

    internal var body: some Scene {
        MenuBarExtra(Bundle.main.bundleName ?? "", systemImage: "music.note") {
            MenuBarView(bridge: self.bridge, preferencesState: self.preferencesState)
        }

        Window("", id: "preferences") {
            PreferencesView(bridge: self.bridge, state: self.preferencesState)
        }
        .windowResizability(.contentSize)
    }
}

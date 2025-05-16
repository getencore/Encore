//
//  ActivityDetailsCoverView.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCoreBridge
import SwiftUI

internal struct ActivityDetailsCoverView: View {
    @ObservedObject internal var bridge: EncoreCoreBridge
    @State private var showingDetailsPopover: Bool = false
    @State private var showingNowPlayingApplicationPopover: Bool = false

    internal var body: some View {
        ZStack {
            AsyncImage(url: self.bridge.coverUrl, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }, placeholder: {
                Color.secondary
            })
            .onHover { hover in
                self.showingDetailsPopover = hover
            }
            .popover(isPresented: self.$showingDetailsPopover) {
                Text(self.bridge.details ?? "")
                    .padding(UI.kActivityPopoverMargin)
            }
            .reverseMask {
                Circle()
                    .frame(width: UI.kActivityArtworkMaskWidth, height: UI.kActivityArtworkMaskHeight)
                    .offset(x: UI.kActivityArtworkMaskOffset, y: UI.kActivityArtworkMaskOffset)
            }
            .overlay {
                Image("Apple Music")
                    .resizable()
                    .frame(width: UI.kActivityArtworkMaskIconWidth, height: UI.kActivityArtworkMaskIconHeight)
                    .onHover { hover in
                        self.showingNowPlayingApplicationPopover = hover
                    }
                    .popover(isPresented: self.$showingNowPlayingApplicationPopover) {
                        Text("PREFERENCES_TAB_ACTIVITIES_PREVIEW_SMALL_ICON_TEXT".localizedWithEnglishFallback("Apple Music"))
                            .padding(UI.kActivityPopoverMargin)
                    }
                    .clipShape(Circle())
                    .offset(x: UI.kActivityArtworkMaskOffset, y: UI.kActivityArtworkMaskOffset)
            }
        }
    }
}

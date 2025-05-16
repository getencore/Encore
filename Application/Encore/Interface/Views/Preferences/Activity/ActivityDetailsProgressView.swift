//
//  ActivityDetailsProgressView.swift
//  Encore
//
//  Created by Alexandra Göttlicher
//

import EncoreCoreBridge
import SwiftUI

internal struct ActivityDetailsProgressView: View {
    @ObservedObject internal var bridge: EncoreCoreBridge
    @State private var localElapsed: CGFloat = 0
    
    internal var body: some View {
        HStack(spacing: 0) {
            ActivityDetailsTimestampView(timestamp: self.localElapsed)

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.primary.opacity(0.2))
                    Capsule()
                        .fill(.primary)
                        .frame(width: geometry.size.width * (self.bridge.duration ?? 0 > 0 ? (self.localElapsed) / (self.bridge.duration ?? 0) : 0))
                }
            }
            .frame(height: 2)
            .padding(.horizontal, 8)

            ActivityDetailsTimestampView(timestamp: self.bridge.duration ?? 0)
        }
        .onAppear {
            localElapsed = bridge.elapsed ?? 0
        }
        .onChange(of: bridge.elapsed) { _, newElapsed in
            localElapsed = newElapsed ?? 0
        }
        .onChange(of: bridge.duration) { _, _ in
            localElapsed = 0
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if (bridge.isPlaying ?? false) {
                localElapsed += 1
            }
        }
    }
}

private struct ActivityDetailsTimestampView: View {
    internal let timestamp: CGFloat

    internal var body: some View {
        Text(self.formattedTimestamp(fromTimestamp: self.timestamp))
            .font(.custom(UI.kActivityFontFamilyProgress, size: UI.kActivityTextSizeText))
            .contentTransition(.numericText())
    }

    private func formattedTimestamp(fromTimestamp timestamp: CGFloat) -> String {
        let totalSeconds: Int = Int(timestamp)
        let minutes: Int = totalSeconds / 60
        let seconds: Int = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

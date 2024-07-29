//
//  MeshGradientView.swift
//  reactnativemeshgradient
//
//  Created by wilmxre on 27.07.2024.
//

import ExpoModulesCore
import SwiftUI

@available(iOS 16.0, *)
struct MeshGradientView: View {
  var meshWidth: Int
  var meshHeight: Int
  var points: [SIMD2<Float>]
  var primaryColors: [Color]
  var secondaryColors: [Color]
  var background: Color = .clear
  var smoothsColors: Bool
  var colorSpace: Gradient.ColorSpace
  var borderRadius: CGFloat
  var isAnimated: Bool
  var animationDuration: TimeInterval
  var animationType: String

  @State private var isAnimating = false

  @State var t: Float = 0.0
  @State var timer: Timer?

  var body: some View {
    ZStack {
      if #available(iOS 18.0, *) {
        MeshGradient(
          width: meshWidth,
          height: meshHeight,
          points: animationType == "sine"
            ? [
              .init(0, 0), .init(0.5, 0), .init(1, 0),
              [
                sinInRange(
                  -0.8...(-0.2), offset: 0.439, timeScale: 0.342, t: t),
                sinInRange(0.3...0.7, offset: 3.42, timeScale: 0.984, t: t),
              ],
              [
                sinInRange(0.1...0.8, offset: 0.239, timeScale: 0.084, t: t),
                sinInRange(0.2...0.8, offset: 5.21, timeScale: 0.242, t: t),
              ],
              [
                sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.084, t: t),
                sinInRange(0.4...0.8, offset: 0.25, timeScale: 0.642, t: t),
              ],
              [
                sinInRange(-0.8...0.0, offset: 1.439, timeScale: 0.442, t: t),
                sinInRange(1.4...1.9, offset: 3.42, timeScale: 0.984, t: t),
              ],
              [
                sinInRange(0.3...0.6, offset: 0.339, timeScale: 0.784, t: t),
                sinInRange(1.0...1.2, offset: 1.22, timeScale: 0.772, t: t),
              ],
              [
                sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.056, t: t),
                sinInRange(1.3...1.7, offset: 0.47, timeScale: 0.342, t: t),
              ],
            ] : points,
          colors: isAnimating ? secondaryColors : primaryColors,
          background: background,
          smoothsColors: smoothsColors,
          colorSpace: colorSpace
        )
        .cornerRadius(borderRadius)
        .onAppear {
          if isAnimated {
            animationType == "sine"
              ? timer = Timer.scheduledTimer(
                withTimeInterval: 0.01, repeats: true
              ) { _ in
                t += 0.02
              }
              : withAnimation(
                .easeInOut(duration: animationDuration).repeatForever(
                  autoreverses: true)
              ) {
                isAnimating.toggle()
              }
          }
        }
      } else {
        Text("MeshGradient is not available on this version of iOS.")
      }
    }

  }
}

func sinInRange(
  _ range: ClosedRange<Float>, offset: Float, timeScale: Float, t: Float
) -> Float {
  let amplitude = (range.upperBound - range.lowerBound) / 2
  let midPoint = (range.upperBound + range.lowerBound) / 2
  return midPoint + amplitude * sin(timeScale * t + offset)
}
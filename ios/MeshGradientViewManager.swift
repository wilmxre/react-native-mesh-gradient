//
//  MeshGradientViewManager.swift
//  reactnativemeshgradient
//
//  Created by wilmxre on 27.07.2024.
//

import React
import SwiftUI

@objc(MeshGradientViewManager)
class MeshGradientViewManager: RCTViewManager {
  override func view() -> UIView! {
    if #available(iOS 16.0, *) {
      return MeshGradientUIView()
    } else {
      return UIView()
    }
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

@available(iOS 16.0, *)
class MeshGradientUIView: UIView {
  private var hostingController: UIHostingController<MeshGradientView>?

  @objc var meshWidth: Int = 3 {
    didSet {
      updateView()
    }
  }

  @objc var meshHeight: Int = 3 {
    didSet {
      updateView()
    }
  }

  @objc var points: [[NSNumber]] = [] {
    didSet {
      updateView()
    }
  }

  @objc var primaryColors: [NSString] = [] {
    didSet {
      updateView()
    }
  }

  @objc var secondaryColors: [NSString] = [] {
    didSet {
      updateView()
    }
  }

  @objc var background: NSString = "" {
    didSet {
      updateView()
    }
  }

  @objc var smoothsColors: Bool = true {
    didSet {
      updateView()
    }
  }

  @objc var colorSpace: NSString = "device" {
    didSet {
      updateView()
    }
  }

  @objc var isAnimated: Bool = false {
    didSet {
      updateView()
    }
  }

  @objc var animationDuration: TimeInterval = 5 {
    didSet {
      updateView()
    }
  }

  @objc var animationType: String = "sine" {
    didSet {
      updateView()
    }
  }

  @objc var borderRadius: CGFloat = 0 {
    didSet {
      updateView()
    }
  }

  private func colorFromHexString(hexString: NSString) -> UIColor {
    var cString: String = hexString.trimmingCharacters(
      in: .whitespacesAndNewlines
    ).uppercased()

    if cString.hasPrefix("#") {
      cString.remove(at: cString.startIndex)
    }

    if cString.count != 6 {
      return UIColor.white
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }

  private func updateView() {

    let pointsSIMD = points.map {
      SIMD2<Float>(Float(truncating: $0[0]), Float(truncating: $0[1]))
    }
    let primaryColorsSwiftUI = primaryColors.map {
      Color(colorFromHexString(hexString: $0))
    }
    let secondaryColorsSwiftUI = secondaryColors.map {
      Color(colorFromHexString(hexString: $0))
    }
    let backgroundColor = Color(colorFromHexString(hexString: background))
    let colorSpaceEnum: Gradient.ColorSpace =
      colorSpace == "perceptual" ? .perceptual : .device

    let meshGradientView = MeshGradientView(
      meshWidth: meshWidth,
      meshHeight: meshHeight,
      points: pointsSIMD,
      primaryColors: primaryColorsSwiftUI,
      secondaryColors: secondaryColorsSwiftUI,
      background: backgroundColor,
      smoothsColors: smoothsColors,
      colorSpace: colorSpaceEnum,
      borderRadius: borderRadius,
      isAnimated: isAnimated,
      animationDuration: animationDuration,
      animationType: animationType
    )

    if hostingController == nil {
      hostingController = UIHostingController(rootView: meshGradientView)
      if let hostingView = hostingController?.view {
        addSubview(hostingView)
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          hostingView.topAnchor.constraint(equalTo: topAnchor),
          hostingView.bottomAnchor.constraint(equalTo: bottomAnchor),
          hostingView.leadingAnchor.constraint(equalTo: leadingAnchor),
          hostingView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
      }
    } else {
      hostingController?.rootView = meshGradientView
    }
  }
}

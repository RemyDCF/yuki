//
//  UIBarButtonItem.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 24.10.19.
//

#if canImport(UIKit)

import UIKit

public extension UIBarButtonItem {
  convenience init(image: UIImage?,
                   style: UIBarButtonItem.Style,
                   target: Any?,
                   action: Selector?,
                   accessbilityLabel: String) {
    self.init(image: image, style: style, target: target, action: action)
    self.accessibilityLabel = accessbilityLabel
  }
}

#endif

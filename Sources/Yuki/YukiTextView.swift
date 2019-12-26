//
//  YukiTextView.swift
//  Yuki
//
//  Created by Rémy on 25.12.19.
//

#if canImport(UIKit)

import UIKit

@available(iOS 9.0, *)
@IBDesignable
class YukiTextView: UITextField {
  let padding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)

  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }

  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }

  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}

#endif

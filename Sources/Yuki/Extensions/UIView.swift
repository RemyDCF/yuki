//
//  UIView.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 23.10.19.
//

#if canImport(UIKit)

import UIKit

public extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get { return self.layer.cornerRadius }
    set { self.layer.cornerRadius = newValue }
  }

  @IBInspectable var borderWidth: CGFloat {
    get { return self.layer.borderWidth }
    set { self.layer.borderWidth = newValue }
  }

  @IBInspectable var borderColor: UIColor {
    get { return UIColor(cgColor: self.layer.borderColor!) }
    set { self.layer.borderColor = newValue.cgColor }
  }
}

#endif

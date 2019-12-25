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
  
  @discardableResult
  func initFromNib<T : UIView>() -> T? {
    guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
      return nil
    }
    self.addSubview(contentView)
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.translatesAutoresizingMaskIntoConstraints = true
    return contentView
  }
  
  @IBInspectable var masksToBounds: Bool {
    get { return self.layer.masksToBounds }
    set { self.layer.masksToBounds = newValue }
  }
  
  @IBInspectable var shadowColor: UIColor {
    get { return UIColor(cgColor: self.layer.shadowColor!) }
    set { self.layer.shadowColor = newValue.cgColor }
  }
  
  @IBInspectable var shadowOffset: CGSize {
    get { return self.layer.shadowOffset }
    set { self.layer.shadowOffset = newValue }
  }
  
  @IBInspectable var shadowOpacity: Float {
    get { return self.layer.shadowOpacity }
    set { self.layer.shadowOpacity = newValue }
  }
  
  @IBInspectable var shadowRadius: CGFloat {
    get { return self.layer.shadowRadius }
    set { self.layer.shadowRadius = newValue }
  }
}

#endif

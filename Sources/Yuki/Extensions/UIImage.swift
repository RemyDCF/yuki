//
//  UIImage.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 24.10.19.
//

#if canImport(UIKit)

import UIKit

extension UIImage {
  public func _withTintColor(_ color: UIColor) -> UIImage {
    if #available(iOS 13.0, *) {
      return self.withTintColor(color)
    }
    else {
      #if os(iOS)
      UIGraphicsBeginImageContextWithOptions(self.size,
                                             false,
                                             UIScreen.main.scale)
      #elseif os(watchOS)
      UIGraphicsBeginImageContextWithOptions(self.size,
                                             false,
                                             WKInterfaceDevice.current().screenScale)
      #else
      println("OMG, it's that mythical new Apple product!!!")
      #endif
      let context = UIGraphicsGetCurrentContext()
      
      color.setFill()
      
      context!.translateBy(x: 0, y: self.size.height)
      context!.scaleBy(x: 1.0, y: -1.0)
      
      context!.setBlendMode(CGBlendMode.colorBurn)
      let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
      context!.draw(self.cgImage!, in: rect)
      
      context!.setBlendMode(CGBlendMode.sourceIn)
      context!.addRect(rect)
      context!.drawPath(using: CGPathDrawingMode.fill)
      
      let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      
      return coloredImage!
    }
  }
  
  public func scaleImage(toSize newSize: CGSize) -> UIImage? {
    let newRect = CGRect(x: 0,
                         y: 0,
                         width: newSize.width,
                         height: newSize.height).integral
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
    if let context = UIGraphicsGetCurrentContext() {
      context.interpolationQuality = .high
      let flipVertical = CGAffineTransform(a: 1,
                                           b: 0,
                                           c: 0,
                                           d: -1,
                                           tx: 0,
                                           ty: newSize.height)
      context.concatenate(flipVertical)
      context.draw(self.cgImage!, in: newRect)
      let newImage = UIImage(cgImage: context.makeImage()!)
      UIGraphicsEndImageContext()
      return newImage
    }
    return nil
  }
  
  public func imageWithInsets(_ insetDimen: CGFloat) -> UIImage {
    return imageWithInset(UIEdgeInsets(top: insetDimen,
                                       left: insetDimen,
                                       bottom: insetDimen,
                                       right: insetDimen))
  }
  
  public func imageWithInset(_ insets: UIEdgeInsets) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(
      CGSize(width: self.size.width + insets.left + insets.right,
             height: self.size.height + insets.top + insets.bottom),
      false,
      self.scale)
    let origin = CGPoint(x: insets.left, y: insets.top)
    self.draw(at: origin)
    let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return imageWithInsets!
  }
}

#endif

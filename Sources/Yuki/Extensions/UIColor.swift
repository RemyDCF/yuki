//
//  UIColor.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 24.10.19.
//

#if canImport(UIKit)

import UIKit

extension UIColor {
  public func lighten(by percentage: CGFloat=0.3) -> UIColor {
    return self.adjust(by: abs(percentage) )
  }
  
  public func darken(by percentage: CGFloat=0.3) -> UIColor {
    return self.adjust(by: -1 * abs(percentage) )
  }
  
  public func adjust(by percentage: CGFloat=0.3) -> UIColor {
    var r: CGFloat=0, g: CGFloat=0, b: CGFloat=0, a: CGFloat=0
    if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
      return UIColor(red: max(min(r + percentage, 1.0), 0),
                     green: max(min(g + percentage, 1.0), 0),
                     blue: max(min(b + percentage, 1.0), 0),
                     alpha: a)
    } else {
      print("Color adjustement failed")
      return self
    }
  }
  
  public var contrast: UIColor {
    var color = self
    
    if cgColor.pattern != nil {
      let size = CGSize(width: 1, height: 1)
      
      UIGraphicsBeginImageContext(size)
      let context = UIGraphicsGetCurrentContext()
      
      context?.interpolationQuality = .medium
      
      let image = UIImage()
      image.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: size),
                 blendMode: .copy,
                 alpha: 1)
      
      let dataPointer = context?.data?.assumingMemoryBound(to: UInt8.self)
      let data = UnsafePointer<UInt8>(dataPointer)
      color = UIColor(red: CGFloat(data![2] / 255),
                      green: CGFloat(data![1] / 255),
                      blue: CGFloat(data![0] / 255),
                      alpha: 1)
      
      UIGraphicsEndImageContext()
    }
    
    var luminance: CGFloat = 0
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha1: CGFloat = 0
    
    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha1)
    
    red *= 0.2126
    green *= 0.7152
    blue *= 0.0722
    
    luminance = red + green + blue
    
    return luminance > 0.6 ? .black : .white
  }
  
  convenience init?(hexString: String) {
    var cString: String = hexString
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .uppercased()
    
    if cString.hasPrefix("#") {
      cString.remove(at: cString.startIndex)
    }
    
    if (cString.count) != 6 {
      return nil
    }
    
    var rgbValue: UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: CGFloat(1.0))
  }
  
  convenience init(_ hex: UInt) {
    self.init(
      red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(hex & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
  var hexValue: String {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    
    self.getRed(&r, green: &g, blue: &b, alpha: &a)
    
    return String(
      format: "#%02X%02X%02X",
      Int(r * 0xff),
      Int(g * 0xff),
      Int(b * 0xff)
    )
  }
}

#endif

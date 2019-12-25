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
  
  var bottomBorder = UIView()
  
  override func awakeFromNib() {
    super.awakeFromNib()

    self.translatesAutoresizingMaskIntoConstraints = false
    
    bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    bottomBorder.translatesAutoresizingMaskIntoConstraints = false
    bottomBorder.backgroundColor = bottomLineColor
    addSubview(bottomBorder)
    
    bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 3).isActive = true
    bottomBorder.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    bottomBorder.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
  
  @IBInspectable var bottomLineColor: UIColor = .gray {
    didSet {
      bottomBorder.backgroundColor = self.bottomLineColor
    }
  }
}

#endif

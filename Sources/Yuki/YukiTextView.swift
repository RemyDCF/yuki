//
//  YukiTextView.swift
//  Yuki
//
//  Created by Rémy on 25.12.19.
//

import UIKit

class YukiTextView: UITextField {
  
  var bottomBorder = UIView()
  
  override func awakeFromNib() {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    bottomBorder.backgroundColor = UIColor.gray
    bottomBorder.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(bottomBorder)
    
    bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
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

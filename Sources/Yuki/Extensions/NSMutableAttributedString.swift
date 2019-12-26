//
//  NSMutableAttributedString.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 26.12.19.
//

#if canImport(UIKit)

import UIKit

public extension NSMutableAttributedString {
    @discardableResult public func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 15)]
        let boldString = NSMutableAttributedString(string: text, attributes: attrs)
        append(boldString)

        return self
    }

    @discardableResult public func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)

        return self
    }
}

#endif
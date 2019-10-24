//
//  Collection.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 24.10.19.
//

import Foundation

public extension Collection {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}

public extension Array {
  mutating func rearrange(from: Int, to: Int) {
    insert(remove(at: from), at: to)
  }
}

public extension Sequence where Iterator.Element: Hashable {
  var uniqueElements: [Iterator.Element] {
    return Array( Set(self) )
  }
}

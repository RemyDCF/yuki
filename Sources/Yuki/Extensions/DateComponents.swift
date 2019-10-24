//
//  DateComponents.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 24.10.19.
//

import Foundation

extension DateComponents {
  public var remainingMinutes: Int {
    var minutes = self.minute ?? 0
    minutes += (self.year ?? 0 * 525600)
    minutes += (self.month ?? 0 * 43800)
    minutes += (self.day ?? 0 * 1440)
    minutes += (self.hour ?? 0 * 60)
    return minutes
  }
}

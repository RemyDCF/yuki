//
//  CLLocationCoordinate2D.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 24.10.19.
//

#if canImport(CoreLocation)

import CoreLocation

extension CLLocationCoordinate2D {
  static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return (lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude)
  }
}

#endif

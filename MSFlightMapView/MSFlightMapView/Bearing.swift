//
//  Bearing.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 03/12/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import Foundation
import CoreLocation

extension Double {
    func toRadian() -> Double {
        return self * (.pi / 180)
    }
    
    func toDegree() -> Double {
        return self * 180 / .pi
    }
    
    func toBearing() -> Double {
        let degree: Double = self.toDegree()
        return degree + 360.0.truncatingRemainder(dividingBy: 360)
    }
}

extension CLLocation {
    func degreeBearing(withTargetLocation target: CLLocation) -> Double {
        var dlon: Double = (target.coordinate.longitude - self.coordinate.longitude).toRadian()
        let dPhi: Double = log(tan(target.coordinate.latitude.toRadian() / 2 + .pi / 4) / tan(self.coordinate.latitude.toRadian() / 2 + .pi / 4))
        if fabs(dlon) > .pi {
            dlon = (dlon > 0) ? (dlon - 2 * .pi) : (2 * .pi + dlon)
        }
        return atan2(dlon, dPhi).toBearing()
    }
}

extension CLLocationCoordinate2D {
    func degreeBearing(withTargetLocation target: CLLocationCoordinate2D) -> Double {
        var dlon: Double = (target.longitude - self.longitude).toRadian()
        let dPhi: Double = log(tan(target.latitude.toRadian() / 2 + .pi / 4) / tan(self.latitude.toRadian() / 2 + .pi / 4))
        if fabs(dlon) > .pi {
            dlon = (dlon > 0) ? (dlon - 2 * .pi) : (2 * .pi + dlon)
        }
        return atan2(dlon, dPhi).toBearing()
    }
}

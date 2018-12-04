//
//  MSMarkerAnimation.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 03/12/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps

class MSMarkerAnimation {
    
    static func buildAnimationOfPath(_ path: GMSPath) -> CAAnimationGroup {
        var latitudes = [CLLocationDegrees]()
        var longitudes = [CLLocationDegrees]()
        var rotations = [CLLocationDegrees]()
        
        for index in 0..<path.count()-1 {
            let location = path.coordinate(at: index)
            let nextLocation = path.coordinate(at: index+1)
            latitudes.append(location.latitude)
            longitudes.append(location.longitude)
            rotations.append(location.degreeBearing(withTargetLocation: nextLocation))
        }
        
        let latAnim = CAKeyframeAnimation(keyPath: "latitude")
        latAnim.values = latitudes
        latAnim.duration = 4
        
        let longAnim = CAKeyframeAnimation(keyPath: "longitude")
        longAnim.values = longitudes
        longAnim.duration = 4
        
        let rotAnim = CAKeyframeAnimation(keyPath: "rotation")
        rotAnim.values = rotations
        rotAnim.duration = 4
        
        let opacityAnim = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnim.values = [0, 1, 1, 1, 1]
        opacityAnim.duration = 2
        opacityAnim.autoreverses = true
        
        let group = CAAnimationGroup()
        group.animations = [latAnim, longAnim, rotAnim, opacityAnim]
        group.duration = 4
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        group.repeatCount = Float.greatestFiniteMagnitude
        
        return group
    }
}

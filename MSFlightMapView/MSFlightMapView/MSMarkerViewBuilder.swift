//
//  MSMarkerViewBuilder.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 03/12/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class MSMarkerViewBuilder {
    
    func buildAirplaneMarker(withFlight flight: MSFlight, andPath path: GMSPath, andColor airplaneColor: UIColor) -> GMSMarker {
        let icon = flight.iconImage ?? UIImage(named: "airplaneIcon")
        let airplaneMarker = GMSMarker(position: flight.firstLocation)
        airplaneMarker.icon = icon?.filledImage(withColor: airplaneColor)
        airplaneMarker.zIndex = 1001
        airplaneMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        airplaneMarker.position = flight.firstLocation
        airplaneMarker.rotation = flight.firstLocation.degreeBearing(withTargetLocation: flight.secondLocation)
        airplaneMarker.layer.add(MSMarkerAnimation.buildAnimationOfPath(path), forKey: "animation")
        return airplaneMarker
    }
    
    func buildMarkerView(withPosition position: CLLocationCoordinate2D, withColor color: UIColor) -> GMSMarker {
        let marker = GMSMarker(position: position)
        marker.zIndex = Int32(arc4random_uniform(1000))
        marker.iconView = MSMarkerViewBuilder().buildIconView(withColor: color)
        marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        return marker
    }
    
    private func buildIconView(withColor color: UIColor) -> MSMarkerIconView {
        let iconView = MSMarkerIconView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        iconView.color = color
        return iconView
    }
}

private class MSMarkerIconView: UIView {
    var color: UIColor = UIColor.red {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = self.bounds.size.width/2
        self.layer.masksToBounds = true
        self.color.setStroke()
        UIColor.white.setFill()
        let path = UIBezierPath(ovalIn: self.bounds.insetBy(dx: 2, dy: 2))
        path.lineWidth = 4
        path.stroke()
        path.fill()
    }
}

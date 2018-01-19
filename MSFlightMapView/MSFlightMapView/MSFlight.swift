//
//  MSFlight.swift
//  Flight Trajectory
//
//  Created by Muhammad Abdul Subhan on 18/01/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit
import GoogleMaps

class MSFlight: NSObject {

    var mapView: GMSMapView?
    var coordinates:[CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
    var polyline = GMSPolyline()
    var animationPolyline = GMSPolyline()
    var path = GMSMutablePath()
    var animationPath = GMSMutablePath()
    var marker = GMSMarker()
    var i: UInt = 0
    var timer: Timer!

    init(withMapView mapMainView:GMSMapView, andCoordinates coordinatesArray:[CLLocationCoordinate2D]) {
        
        super.init()
        
        mapView = mapMainView

        let first:CLLocationCoordinate2D = coordinatesArray[0]
        let second:CLLocationCoordinate2D = coordinatesArray[1]

        // Dividing to smaller parts of 50 KM
        let distanceInKilometers = CLLocation(latitude: first.latitude, longitude: first.longitude).distance(from: CLLocation(latitude: second.latitude, longitude: second.longitude)) / 1000
        let totalPoints:Int = Int(distanceInKilometers / 50)
        var newArray:[CLLocationCoordinate2D] = [first]

        let diffLat = second.latitude - first.latitude
        let diffLong = second.longitude - first.longitude
        let intLat = diffLat / Double(totalPoints + 1)
        let intLong = diffLong / Double(totalPoints + 1)
        
        for i in 1...totalPoints {
            let lat = first.latitude + intLat * Double(i)
            let long = first.longitude + intLong * Double(i)
            newArray.append(CLLocationCoordinate2D(latitude: lat, longitude: long))
        }

        coordinates = newArray
        
        // Setting GMSPath
        path = GMSMutablePath()
        for current in coordinates {
            path.add(current)
        }

        // Drawing and Animating Route
        drawRoute()

        // Setting marker
        marker = GMSMarker()
        marker.iconView = UIImageView(image: UIImage(named: "airplaneicon"))
        marker.position = self.path.coordinate(at: 0)
        marker.map = mapView

    }
    
    // Location Methods
    func toRad(_ degrees: Double) -> Double {
        return degrees * (.pi / 180)
    }
    
    func toBearing(_ radians: Double) -> Double {
        let degree: Double = toDegrees(radians)
        return degree + 360.0.truncatingRemainder(dividingBy: 360)
    }
    
    func toDegrees(_ radians: Double) -> Double {
        return radians * 180 / .pi
    }
    
   
    func degreeBearing(_ A: CLLocation, locationB B: CLLocation) -> Double {
        var dlon: Double = toRad((B.coordinate.longitude - A.coordinate.longitude))
        let dPhi: Double = log(tan(toRad(B.coordinate.latitude) / 2 + .pi / 4) / tan(toRad(A.coordinate.latitude) / 2 + .pi / 4))
        if fabs(dlon) > .pi {
            dlon = (dlon > 0) ? (dlon - 2 * .pi) : (2 * .pi + dlon)
        }
        return toBearing(atan2(dlon, dPhi))
    }
    
    // Animations
    @objc func drawRoute() {
        self.marker.iconView?.alpha = 1
        
        self.polyline.path = self.path
        self.polyline.strokeColor = UIColor(red: 211/255.0, green: 31/255.0, blue: 56/255.0, alpha: 0.25)
        self.polyline.strokeWidth = 2
        self.polyline.geodesic = true
        self.polyline.map = self.mapView
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(animatePolylinePath), userInfo: nil, repeats: true)
    }
    
    @objc func animatePolylinePath() {
        if (self.i < self.path.count()) {
            
            marker.rotation = degreeBearing(CLLocation(latitude: marker.position.latitude, longitude: marker.position.longitude), locationB: CLLocation(latitude: self.path.coordinate(at: self.i).latitude, longitude: self.path.coordinate(at: self.i).longitude))
            marker.position = self.path.coordinate(at: self.i)
            
            self.animationPath.add(self.path.coordinate(at: self.i))
            self.animationPolyline.path = self.animationPath
            self.animationPolyline.strokeColor = UIColor(red: 211/255.0, green: 31/255.0, blue: 56/255.0, alpha: 1)
            self.animationPolyline.strokeWidth = 2
            self.animationPolyline.geodesic = true
            self.animationPolyline.map = self.mapView
            self.i += 1
        }
        else {
            
            removeAnimation()
            UIView.animate(withDuration: 1, animations: {
                self.marker.iconView?.alpha = 0
            }, completion: { (finished) in
                self.i = 0
                self.animationPath = GMSMutablePath()
                self.animationPolyline.map = nil
                self.marker.position = self.path.coordinate(at: self.i)
                self.marker.rotation = self.degreeBearing(CLLocation(latitude: self.self.marker.position.latitude, longitude: self.marker.position.longitude), locationB: CLLocation(latitude: self.path.coordinate(at: self.i+1).latitude, longitude: self.path.coordinate(at: self.i+1).longitude))
                self.timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.drawRoute), userInfo: nil, repeats: false)
            })
            
        }
        
    }
    
    func removeAnimation() {
        self.timer.invalidate()
    }

}
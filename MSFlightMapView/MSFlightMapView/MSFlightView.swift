//
//  MSFlightView.swift
//  Flight Trajectory
//
//  Created by Muhammad Abdul Subhan on 15/01/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit
import GoogleMaps

class MSFlightView: UIView {
    
    var mapView: GMSMapView?

    init(withFrame frame:CGRect, coordinatesArray:[[CLLocationCoordinate2D]]) {
        super.init(frame: frame)

        
        // Setting MapView
        let camera = GMSCameraPosition.camera(withLatitude: (coordinatesArray.first?.first?.latitude)!, longitude: (coordinatesArray.first?.first?.longitude)!, zoom: 5.0)
        mapView = GMSMapView.map(withFrame: self.frame, camera: camera)

        do {
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                self.mapView?.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }

        self.addSubview(mapView!)

        for coordinate in coordinatesArray {
            _ = MSFlight.init(withMapView: mapView!, andCoordinates: coordinate)
        }

        
        /*
        // Setting screen bounds to fit gmspolyline
        var bounds = GMSCoordinateBounds()
        for index in 0...path.count() {
            bounds = bounds.includingCoordinate(path.coordinate(at: index))
        }
        mapView?.animate(with: GMSCameraUpdate.fit(bounds))
         */
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

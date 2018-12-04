//
//  MSFlightMapView.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 03/12/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit
import GoogleMaps

class MSFlightMapView: GMSMapView {
    
    var pathColor: UIColor = MSConstants.lightGrayColor {
        didSet {
            redraw()
        }
    }
    
    var markerColor: UIColor = MSConstants.primaryRedColor {
        didSet {
            redraw()
        }
    }
    
    var iconColor: UIColor = MSConstants.primaryRedColor {
        didSet {
            redraw()
        }
    }

    var flights: [MSFlight] = [] {
        didSet {
            redraw()
        }
    }
    
    var defaultLocation: CLLocationCoordinate2D =  CLLocationCoordinate2D(latitude: 24.9056, longitude: 67.0822) {
        didSet {
            let camera = GMSCameraUpdate.setCamera(GMSCameraPosition.camera(withLatitude: defaultLocation.latitude, longitude: defaultLocation.longitude, zoom: 3.0))
            self.animate(with: camera)
        }
    }

    func redraw() {
        self.clear()
        let markerBuilder = MSMarkerViewBuilder()
        
        for flight in flights {
            let path = GeodesicPathBuilder.buildGeodesicPathBetween(flight.firstLocation, flight.secondLocation)
            let departureMarker = markerBuilder.buildMarkerView(withPosition: flight.firstLocation, withColor: flight.markerColor ?? markerColor)
            let arrivalMarker = markerBuilder.buildMarkerView(withPosition: flight.secondLocation, withColor: flight.markerColor ?? markerColor)
            let airplaneMarker = markerBuilder.buildAirplaneMarker(withFlight: flight, andPath: path, andColor: flight.iconColor ?? iconColor)
            let polyline = MSPathBuilder().buildGeodesicPolyline(path, andColor: flight.pathColor ?? pathColor)

            departureMarker.map = self
            arrivalMarker.map = self
            airplaneMarker.map = self
            polyline.map = self
        }
        
        self.focusMapToRoutes()
    }
    
    func focusMapToRoutes() {
        var bounds = GMSCoordinateBounds()
        for flight in flights {
            bounds = bounds.includingCoordinate(flight.firstLocation)
            bounds = bounds.includingCoordinate(flight.secondLocation)
        }
        let update = GMSCameraUpdate.fit(bounds, withPadding: CGFloat(20))
        self.animate(with: update)
    }
}

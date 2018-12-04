//
//  MSPathBuilder.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 04/12/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import Foundation
import GoogleMaps
import MapKit

class MSPathBuilder {
    
    func buildGeodesicPolyline(_ path: GMSPath, andColor color: UIColor) -> GMSPolyline {
        let polyline = GMSPolyline()
        polyline.path = path
        polyline.strokeColor = color
        polyline.strokeWidth = 2
        polyline.geodesic = true
        return polyline
    }
}

class GeodesicPathBuilder {
    static func buildGeodesicPathBetween(_ firstCoordinate: CLLocationCoordinate2D, _ secondCoorindate: CLLocationCoordinate2D) -> GMSMutablePath {
        let newPath = GMSMutablePath()
        let coor = [firstCoordinate, secondCoorindate]
        let mapkitLine = MKGeodesicPolyline(coordinates: coor, count: 2)
        for point in UnsafeBufferPointer(start: mapkitLine.points(), count: mapkitLine.pointCount) {
            newPath.add(MKCoordinateForMapPoint(point))
        }
        return newPath
    }
}

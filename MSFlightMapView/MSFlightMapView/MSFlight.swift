//
//  MSFlight.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 18/01/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit
import GoogleMaps

open class MSFlight: NSObject {
    var departure:CLLocationCoordinate2D = CLLocationCoordinate2D()
    var arrival:CLLocationCoordinate2D = CLLocationCoordinate2D()
    public var pathPrimaryColor:UIColor = UIColor()
    public var pathSecondaryColor:UIColor = UIColor()
    public var airplaneColor:UIColor = UIColor()

    public init(withDeparture departure:CLLocationCoordinate2D, andArrival arrival:CLLocationCoordinate2D, andPathPrimaryColor pathColor:UIColor, andPathSecondaryColor pathSecondaryColor:UIColor, andAirplaneColor airplaneColor:UIColor) {
        super.init()
        self.arrival = arrival
        self.departure = departure
        self.pathPrimaryColor = pathColor
        self.pathSecondaryColor = pathSecondaryColor
        self.airplaneColor = airplaneColor
    }
}

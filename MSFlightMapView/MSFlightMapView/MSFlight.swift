//
//  MSFlight.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 18/01/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit
import GoogleMaps

class MSFlight: NSObject {
    var departure:CLLocationCoordinate2D = CLLocationCoordinate2D()
    var arrival:CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    init(withDeparture departure:CLLocationCoordinate2D, andArrival arrival:CLLocationCoordinate2D) {
        super.init()
        self.arrival = arrival
        self.departure = departure
    }
}

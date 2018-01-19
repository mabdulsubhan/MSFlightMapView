//
//  ViewController.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 19/01/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let redColor:UIColor = UIColor(red: 211/255.0, green: 31/255.0, blue: 56/255.0, alpha: 1)
        let redColor2:UIColor = UIColor(red: 211/255.0, green: 31/255.0, blue: 56/255.0, alpha: 0.25)

        let blueColor:UIColor = UIColor(red: 56/255.0, green: 31/255.0, blue: 211/255.0, alpha: 1)
        let blueColor2:UIColor = UIColor(red: 56/255.0, green: 31/255.0, blue: 211/255.0, alpha: 0.25)

        let blackColor:UIColor = UIColor.black
        
        let EnglandToMadagascar:MSFlight = MSFlight.init(withDeparture: CLLocationCoordinate2D(latitude:53.206389, longitude: -0.861111), andArrival: CLLocationCoordinate2D(latitude:-19.002846, longitude: 46.460938), andPathPrimaryColor: redColor, andPathSecondaryColor: redColor2, andAirplaneColor: blackColor)
        let KarachiToEngland:MSFlight = MSFlight.init(withDeparture: CLLocationCoordinate2D(latitude:25.183611, longitude: 66.600278), andArrival: CLLocationCoordinate2D(latitude:53.206389, longitude: -0.861111), andPathPrimaryColor: blueColor, andPathSecondaryColor: blueColor2, andAirplaneColor: blackColor)
        let NorwayToNewyork:MSFlight = MSFlight.init(withDeparture: CLLocationCoordinate2D(latitude:60.4720, longitude: 8.4689), andArrival: CLLocationCoordinate2D(latitude:40.7128, longitude: -73.935242), andPathPrimaryColor: redColor, andPathSecondaryColor: redColor2, andAirplaneColor: blackColor)
        let BrazilToMoscow:MSFlight = MSFlight.init(withDeparture: CLLocationCoordinate2D(latitude:-22.970722, longitude: -43.182365), andArrival: CLLocationCoordinate2D(latitude:55.751244, longitude: 37.618423), andPathPrimaryColor: blueColor, andPathSecondaryColor: blueColor2, andAirplaneColor: blackColor)
        
        let flights:[MSFlight] = [KarachiToEngland, NorwayToNewyork, EnglandToMadagascar, BrazilToMoscow]
        
        self.view = MSFlightMapView.init(withFrame: self.view.frame, andFlights: flights)
        
    }

}


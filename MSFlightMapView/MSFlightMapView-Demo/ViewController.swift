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
    
    @IBOutlet weak var mapView: MSFlightMapView!
    
    func setupStyling() {
        let url = Bundle.main.url(forResource: "style", withExtension: "json")!
        if let style =  try? GMSMapStyle(contentsOfFileURL: url){
            mapView.mapStyle = style
        } else {
            print("The style definition could not be loaded for url : \(url)")
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
  
        setupStyling()
        
        let london = CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.118092)
        let berlin = CLLocationCoordinate2D(latitude: 52.531677, longitude: 13.381777)
        let ankara = CLLocationCoordinate2D(latitude: 39.925533, longitude: 32.866287)
        let karachi = CLLocationCoordinate2D(latitude: 24.946218, longitude: 67.005615)
        let moscow = CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423)
        
        // Single Flights
//        let berlinToLondon = MSFlight(withFirstLocation: berlin, withSecondLocation: london)
//        let ankaraToMoscow = MSFlight(withFirstLocation: ankara, withSecondLocation: moscow, andIconImage: nil, andIconColor: UIColor.red, andPathColor: UIColor.orange, andMarkerColor: UIColor.blue)
//        self.mapView.flights = [berlinToLondon, ankaraToMoscow]

        // Multi leg flights
//        let f = MSMultiLegFlight(withLocations: [london, berlin, ankara, karachi, moscow])
//        self.mapView.flights = f.flights
        
        // Connecting flights
        self.mapView.flights = MSFlight(withFirstLocation: berlin, withSecondLocation: london).connecting(toLocation: ankara).connecting(toLocation: berlin)
        
    }
}


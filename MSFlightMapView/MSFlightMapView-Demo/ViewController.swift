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

        let EnglandToMadagascar:[CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude:53.206389, longitude: -0.861111),
                                                            CLLocationCoordinate2D(latitude:-19.002846, longitude: 46.460938)]
        let khiToEngland:[CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude:25.183611, longitude: 66.600278),
                                                     CLLocationCoordinate2D(latitude:53.206389, longitude: -0.861111)]
        let RomeToSydney:[CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude:41.9028, longitude: 12.4964),
                                                     CLLocationCoordinate2D(latitude:-33.865143, longitude: 151.209900)]
        let khiToBrazil:[CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude:25.183611, longitude: 66.600278),
                                                    CLLocationCoordinate2D(latitude:-22.970722, longitude: -43.182365)]
        let khiToMoscow:[CLLocationCoordinate2D] = [CLLocationCoordinate2D(latitude:25.183611, longitude: 66.600278),
                                                    CLLocationCoordinate2D(latitude:55.751244, longitude: 37.618423)]
        
        let coordinates:[[CLLocationCoordinate2D]] = [khiToEngland, RomeToSydney, khiToBrazil, EnglandToMadagascar, khiToMoscow]
        
        self.view = MSFlightView.init(withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), coordinatesArray: coordinates)
    }

}


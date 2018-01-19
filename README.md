<img src="./msflightViewdemo.gif" width="20%">

# MSFlightMapView
[![CocoaPods](https://img.shields.io/cocoapods/p/MSFlightMapView.svg)](https://cocoapods.org/pods/MSFlightMapView)
[![CocoaPods](https://img.shields.io/cocoapods/v/MSFlightMapView.svg)](http://cocoapods.org/pods/MSFlightMapView)
[![Twitter](https://img.shields.io/badge/Twitter-@ThisIsSubhan-blue.svg?style=flat)](http://twitter.com/ThisIsSubhan)
## Requirements

- iOS 10.0+
- Xcode 9.0

## Installation

Just add the MSFlightMapView folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:
```
pod 'MSFlightMapView'
```

## Usage

1. To use MSFlightMapView, you would be needing to create MSFlight objects first like :
```
let EnglandToMadagascar:MSFlight = MSFlight.init(withDeparture: CLLocationCoordinate2D(latitude:53.206389, longitude: -0.861111), andArrival: CLLocationCoordinate2D(latitude:-19.002846, longitude: 46.460938), andPathPrimaryColor: UIColor.red, andPathSecondaryColor: UIColor.brown, andAirplaneColor: UIColor.black)
```
2. Then set you view's subclass to MSFlightMapView and initialize it with the array of MSFlight objects
```
self.view = MSFlightMapView.init(withFrame: self.view.frame, andFlights: flights)
```
3. That's it!

## Licence

Folding cell is released under the MIT license.
See [LICENSE](./LICENSE) for details.

# MSFlightMapView
[![CocoaPods](https://img.shields.io/cocoapods/p/MSFlightMapView.svg)](https://cocoapods.org/pods/MSFlightMapView)
[![CocoaPods](https://img.shields.io/cocoapods/v/MSFlightMapView.svg)](http://cocoapods.org/pods/MSFlightMapView)
[![Twitter](https://img.shields.io/badge/Twitter-@ThisIsSubhan-blue.svg?style=flat)](http://twitter.com/ThisIsSubhan)

## Demo
<img src="./msflightViewdemo.gif" width="30%">

## Requirements

- iOS 10.0+
- Xcode 9.0+

## Installation

Just add the MSFlightMapView folder to your project.

or use [CocoaPods](https://cocoapods.org):
```
pod 'MSFlightMapView'
```

## Usage

### Flights Creation

To use MSFlightMapView, we would be needing to create MSFlight objects. It can be created in the following ways:

#### 1. MSFlight

`MSFlight(withFirstLocation: London, withSecondLocation: Paris)`

MSFlight are single leg flights having a destination and an arrival.
We can set the following attributes of a flight :

`firstLocation` - The Departure of the flight

`secondLocation` - The Arrival of the flight

`iconImage` - The marker image

`iconColor` - The color of the marker

`pathColor` - The path color between departure and arrival

`markerColor` - The color of markers of departure and arrival

> `MSFlight` can be further extended to connecting flights by using `.connecting(toLocation: CLLocationCoordinate2D)` to either a `MSFlight` object or an array of `MSFlight`


#### 2. MSMultiLegFlight

`MSMultiLegFlight(withLocations: [London, Berlin, Ankara, Moscow])`

`MSMultiLegFlight` are connecting flights between a number of locations. It generates `MSFlight` objects so it can be further customised as mentioned above.

### Map Creation

`MSFlightMapView` is a subclass of `GMSMapView`. We can set and animate flights on the map just by using :

**For MSFlight**
```
let flight = MSFlight(withFirstLocation: London, withSecondLocation: Berlin).connecting(toLocation: Moscow)
mapView.flights = [flight]
```

**For MSMultiLegFlight**
```
let flightPlan = MSMultiLegFlight(withLocations: [London, Berlin, Ankara, Moscow])
mapView.flights = flightPlan.flights
```

## Licence

MSFlightMapView is released under the MIT license.
See [LICENSE](./LICENSE) for details.

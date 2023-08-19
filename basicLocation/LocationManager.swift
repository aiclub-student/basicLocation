//
//  LocationManager.swift
//  basicLocation
//
//  Created by Amit Gupta on 7/29/23.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLatitude: String = ""
    @Published var userLongitude: String = ""

    private var locationManager = CLLocationManager()
    private var defaultLocation = CLLocation(latitude: 37.7, longitude: -122.4)

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLatitude = "\(location.coordinate.latitude)"
            userLongitude = "\(location.coordinate.longitude)"
        }
    }
    
    func getStoredLocation() -> CLLocation {
        let loc = locationManager.location

        let l = CLLocation(latitude: loc?.coordinate.latitude ?? defaultLocation.coordinate.latitude,
                           longitude: loc?.coordinate.longitude ?? defaultLocation.coordinate.longitude)
            return l

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
}

//
//  ContentView.swift
//  basicLocation
//
//  Created by Amit Gupta on 7/29/23.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    @ObservedObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            Text("User's Current Location")
                .font(.title)
                .padding()

            Text("Latitude: \(locationManager.userLatitude)")
            Text("Longitude: \(locationManager.userLongitude)")

            Button("Get Location") {
                locationManager.requestLocation()
            }
            Button("Find neighbours") {
                findNeighbours()
            }
            .padding()
        }
    }
    
    func findNeighbours() {
        let loc = locationManager.getStoredLocation()
            let businessList = findNearestBusinesses(from: loc, businesses: businesses, topN: 2)
        for b in businessList {
            print("Neighour is \(b)")
        }

    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}



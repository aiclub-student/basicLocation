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
            .padding()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}



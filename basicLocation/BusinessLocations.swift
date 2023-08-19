//
//  BusinessLocations.swift
//  basicLocation
//
//  Created by Amit Gupta on 8/19/23.
//

import Foundation
import CoreLocation

// Define the Business structure
struct Business {
    let name: String
    let location: CLLocation
}

// Define an array of businesses
var businesses: [Business] = [
    Business(name: "Business 1", location: CLLocation(latitude: 37.774929, longitude: -122.419416)),
    Business(name: "Business 2", location: CLLocation(latitude: 37.884929, longitude: -122.329416)),
    Business(name: "Business 3", location: CLLocation(latitude: 37.694929, longitude: -122.239416)),
    Business(name: "Business 4", location: CLLocation(latitude: 37.904929, longitude: -122.149416)),
    Business(name: "Business 5", location: CLLocation(latitude: 37.514929, longitude: -122.059416))
]

func findNearestBusinesses(from location: CLLocation, businesses: [Business], topN: Int) -> [Business] {
    // Sort the businesses based on their distance from the given location
    let b=LoadBusinessData.getBusinesses()
    
        let sortedBusinesses = b.sorted {
            let distance1 = location.distance(from: $0.location)
            let distance2 = location.distance(from: $1.location)
            return distance1 < distance2
        }
        
        // Return the top n nearest businesses
        return Array(sortedBusinesses.prefix(topN))
    
}

//
//  LoadBusinessData.swift
//  basicLocation
//
//  Created by Amit Gupta on 8/19/23.
//

import Foundation
import CoreLocation

class LoadBusinessData {
    
    static var businessList:[Business] = []
    
    static func initialize() {
        if let filepath = Bundle.main.path(forResource: "InterestingLocations", ofType: "csv") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
                var sa: [String] = contents.components(
                    separatedBy: "\n"
                )
                sa.removeFirst()
                for st in sa {
                    let sb:[String]=st.components(separatedBy: ",")
                    //print("SB is \(sb)")
                    if sb.count<3 {
                        continue
                    }
                    let lat=Double(sb[0]) ?? 37.0
                    let lon=Double(sb[1]) ?? -122.0
                    let nam=sb[2]
                    let des=sb[3]
                    let b = Business(name: nam, location: CLLocation(latitude: lat, longitude: lon))
                    print("Appending business \(b)")
                    businessList.append(b)
                }
            } catch {
                // contents could not be loaded
                print("Do catch error")
            }
        } else {
            // example.txt not found!
            print("File not found")
        }
    }
    
    static func getBusinesses() -> [Business] {
        if(businessList.count<2) {
            initialize()
        }
        return businessList
    }
}


//
//  Location.swift
//  MapApp
//
//  Created by MacBook on 04/11/2024.
//

import Foundation
import MapKit


struct Location {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}


//Location(
//    name: "Pantheon",
//    cityName: "Rome",
//    coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
//    description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
//    imageNames: [
//        "rome-pantheon-1",
//        "rome-pantheon-2",
//        "rome-pantheon-3",
//    ],
//    link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),

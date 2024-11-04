//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by MacBook on 04/11/2024.
//

import Foundation
import _MapKit_SwiftUI


class LocationsViewModel: ObservableObject {
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var locations : [Location] = []
    @Published var mapLocation : Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion : MapCameraPosition
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.mapRegion = MapCameraPosition.region(
            MKCoordinateRegion(
                center: locations.first!.coordinates,
                span: mapSpan
            )
        )
    }
    
    func updateMapRegion(location: Location) -> Void {
            mapRegion = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )
    }
}

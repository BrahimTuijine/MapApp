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
    
    
    // All loaded locations
    @Published var locations : [Location] = []
    
    // Current locations on map
    @Published var mapLocation : Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    // Current region on map
    @Published var mapRegion : MapCameraPosition
    
    // Show list of loactions
    @Published var showList: Bool = false
    
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
    
    private func updateMapRegion(location: Location) -> Void {
            mapRegion = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )
    }
    
    private func toggleLocationsList() -> Void {
        showList.toggle()
    }
}

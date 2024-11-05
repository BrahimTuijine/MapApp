//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by MacBook on 04/11/2024.
//

import Foundation
import _MapKit_SwiftUI


class LocationsViewModel: ObservableObject {
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    
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
    
    func showNextLocation(location: Location) -> Void {
        mapLocation = location
        showList = false
    }
    
    func nextButtonPressed() -> Void {

       // get current map location index
        
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {return}
        
       // check currentIndex + 1 is valid
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            showNextLocation(location: locations.first!)
            return
        }
        
       // else assign first location
        
        let nextLocation = locations[nextIndex]
        
        showNextLocation(location: nextLocation)

    }
}

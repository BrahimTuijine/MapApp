//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by MacBook on 04/11/2024.
//

import Foundation


class LocationsViewModel: ObservableObject {
    
    
    @Published var locations : [Location] = []
    
    init() {
        locations = LocationsDataService.locations
        
    }
}

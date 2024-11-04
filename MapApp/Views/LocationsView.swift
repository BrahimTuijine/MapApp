//
//  LocationsView.swift
//  MapApp
//
//  Created by MacBook on 04/11/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject var vm : LocationsViewModel
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var body: some View {
        ZStack {
            Map(position: $position)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

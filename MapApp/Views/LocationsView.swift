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
    
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

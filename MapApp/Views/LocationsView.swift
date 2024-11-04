//
//  LocationsView.swift
//  MapApp
//
//  Created by MacBook on 04/11/2024.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject var vm : LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Text(location.name )
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

//
//  LocationListView.swift
//  MapApp
//
//  Created by MacBook on 05/11/2024.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                    
            }
            
        }
        .padding(.vertical, 4)
        .listStyle(.plain)
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationsViewModel())
}

extension LocationListView {
    private func listRowView(location : Location) -> some View {
        return HStack {
            if let imageName = location.imageNames.first {
                Image(imageName )
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(8)
                    .frame(width: 45, height: 45)
                    
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                
            }
        }
    }
}

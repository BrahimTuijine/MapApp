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
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
            }
            
        }
        .animation(.easeInOut, value: vm.showList)
    
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(
                            Angle(degrees: vm.showList ? 180 : 0),
                            anchor: .center
                        )
                }
                .onTapGesture {
                    vm.showList.toggle()
                }
            
            if vm.showList {
                LocationListView()
                    .frame(height: 420)      
            }
                
            
        }
        .background(.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity (0.3), radius: 20, x: 0, y: 15)
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

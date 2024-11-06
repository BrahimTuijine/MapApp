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
            
            mapLayer.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                
                locationPreviewStack
            }
            
        }
        .animation(.easeInOut, value: UUID())
    
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
    
    private var mapLayer: some View {
        Map(position: $vm.mapRegion) {
            ForEach(vm.locations) { location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
                                   
            }
        }
    }
    
    private var locationPreviewStack : some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            )
                        )
                }
                
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

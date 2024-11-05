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
    @State var showList: Bool = false
    
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
        .animation(.easeInOut, value: showList)
    
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
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.leading)
                }
                .onTapGesture {
                    showList.toggle()
                }
            
            if showList {
                List {
                    ForEach(0..<3) { _ in
                        Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                    }
                }
                .frame(height: 400)
                .listStyle(.plain)
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

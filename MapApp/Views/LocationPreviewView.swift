//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by MacBook on 05/11/2024.
//

import SwiftUI


struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    let location : Location
    

    
    var body: some View {
        
            ZStack(alignment: .topLeading) {
                HStack(alignment: .bottom) {
                    locationInfo
                    
                    Spacer()
                    VStack {
                        LocationDetailsView(location: location)
                        
                        nextButton
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .padding()
            
                roundedImage
            }
            .shadow(color: Color.black.opacity(0.3), radius: 10)
        
    }
}

extension LocationPreviewView {
    
    
    private var nextButton : some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .padding(.horizontal, 20)
                .frame(width: 125, height: 35)
        })
        .buttonStyle(.bordered)
        .background(.gray.opacity(0.1))
        .cornerRadius(10)
    }
    
    private var roundedImage: some View {
        Image(location.imageNames.first!)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .padding(7)
            .frame(width: 120, height: 120)
            .background(.white)
            .cornerRadius(10)
            .offset(x: 28, y: -30)
    }
    
    private var locationInfo : some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
        
}

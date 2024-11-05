//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by MacBook on 05/11/2024.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location : Location
    
    var body: some View {
        ZStack {
            Color.green
            
            ZStack {
                HStack(alignment: .bottom) {
                    locationInfo
                    
                    Spacer()
                    VStack {
                        learnMoreButton
                        
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
        }
    }
}

extension LocationPreviewView {
    private var learnMoreButton : some View {
        Button(action: {
            
        }, label: {
            Text("Learn more")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 125, height: 35)
        })
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton : some View {
        Button(action: {
            
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
            .offset(x: -105, y: -70)
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
        
}

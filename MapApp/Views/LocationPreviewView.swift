//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by MacBook on 05/11/2024.
//

import SwiftUI
import MapKit

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    let location : Location
    @State var showSheet: Bool = false

    
    var body: some View {
        
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
            .shadow(color: Color.black.opacity(0.3), radius: 10)
        
    }
}

extension LocationPreviewView {
    private var learnMoreButton : some View {
        Button(action: {
            showSheet = true
        }, label: {
            Text("Learn more")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 125, height: 35)
        })
        .buttonStyle(.borderedProminent)
        .sheet(isPresented: $showSheet , content: {
            sheetContent
        })
    }
    
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
            .offset(x: -107, y: -70)
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
    
    private var sheetContent: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TabView {
                    ForEach(location.imageNames, id: \.self) {
                        Image($0)
                            .resizable()
                            .scaledToFill()
                            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                    }
                    
                }
                .tabViewStyle(.page)
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(location.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(location.cityName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Divider()

                    Text(location.description)
                        .foregroundColor(.secondary)
                    
                    if let url = URL(string: location.link) {
                        Link("Read more on Wikipedia",
                             destination: url
                        )
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    
                    sheetMapView
                }
                .padding()
                
                
                   
            }
        }
        .background(.ultraThinMaterial)
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button(action: {
                showSheet = false
            }, label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .padding(16)
                    .foregroundColor(.primary)
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    .padding()
                
            })
        }
    }
    
    private var sheetMapView : some View {
        Map(position: .constant(MapCameraPosition.region(
            MKCoordinateRegion(
                center: location.coordinates,
                span: vm.mapSpan
            )))) {
                
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .shadow(radius: 10)
                }
            }
            .allowsHitTesting(false)
            .cornerRadius(10)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
        
}

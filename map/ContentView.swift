//
//  ContentView.swift
//  map
//
//  Created by frh alshaalan on 07/05/2023.
//

import SwiftUI
import MapKit



struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State var showsAlert = false

    let locations = [
        Location(name: "apple academy ", coordinate: CLLocationCoordinate2D(latitude: 24.7311, longitude: 46.6701)),
        Location(name: "Tower of kingdom", coordinate: CLLocationCoordinate2D(latitude: 24.86405, longitude: 46.71735))
    ]
    
    
    
    var body: some View {

        Map(coordinateRegion: $viewModel.mapRegion,  showsUserLocation: true)
//        { location in
//            MapAnnotation(coordinate: location.coordinate) {
//                    Circle()
//                        .stroke(.red, lineWidth: 3)
//                        .frame(width: 10, height: 44)
//
//            }
//
//        }
      
        
        .ignoresSafeArea()
        .accentColor(Color(.systemPink))
        .onAppear(){
            viewModel.checkIfLocationServiceIsEnabled()
            
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


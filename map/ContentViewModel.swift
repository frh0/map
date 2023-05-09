//
//  class.swift
//  map
//
//  Created by frh alshaalan on 08/05/2023.
//

import Foundation
import SwiftUI
import MapKit

final class ContentViewModel : NSObject, ObservableObject,CLLocationManagerDelegate{
    @State var showAlert = false

    
    var locationmanger : CLLocationManager?
    @Published  var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:24.7136, longitude: 46.6753), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    
    func checkIfLocationServiceIsEnabled(){

        if CLLocationManager.locationServicesEnabled(){
            locationmanger = CLLocationManager()
            CheckLocationAuth()
                        locationmanger?.desiredAccuracy = kCLLocationAccuracyBest
            locationmanger!.delegate = self
        }
        else{
            print("alert ")
        }
            
        func CheckLocationAuth(){

            guard let locationmanger = locationmanger else {return}
            switch locationmanger.authorizationStatus {
                
            case .notDetermined:
                locationmanger.requestWhenInUseAuthorization()
                
            case .restricted:
                print("ur location is restricted")

            case .denied:
                print("ur location is restricted")
                showAlert.toggle()

                    exit(-1)
                

            case .authorizedAlways, .authorizedWhenInUse:
                mapRegion = MKCoordinateRegion(center: locationmanger.location!.coordinate, span: MKCoordinateSpan(latitudeDelta:24.7136, longitudeDelta: 46.6753))
                
                
            @unknown default:
                break
            }
        }
        
        func locationMangerDidChangeAuthorization(_ manager: CLLocationManager){
            CheckLocationAuth()
        }
        
    }
    
}

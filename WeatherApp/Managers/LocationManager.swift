//
//  LocationManager.swift
//  Weather Findr
//
//  Created by Kevin Zhang on 9/19/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let clManager = CLLocationManager()
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init(){
        super.init()
        clManager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        clManager.requestLocation()
    }
    
    func locationManager(_ clManager: CLLocationManager, didUpdateLocation locations:[CLLocation]){
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ clManager: CLLocationManager, didFailWithError error: Error) {
        print("Error with location", error)
        isLoading = false
    }
}

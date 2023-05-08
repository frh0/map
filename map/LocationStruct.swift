//
//  struct.swift
//  map
//
//  Created by frh alshaalan on 08/05/2023.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

//
//  Destination.swift
//  ViewSeeker
//
//  Created by Minh Vo on 30/07/2023.
//

import SwiftUI
import CoreLocation

struct Destination: Identifiable, Codable{
    var id: Int
    var name: String
    var shortDescription: String
    var description: String
    var starReview: Int
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var coordinates: Coordinates

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}

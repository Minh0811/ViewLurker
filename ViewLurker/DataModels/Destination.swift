/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vo Khai Minh
  ID: s3879953
  Created  date: 30/07/2023.
  Last modified: 30/08/2023.
  Acknowledgement:
*/

import SwiftUI
import CoreLocation

struct Destination: Identifiable, Codable{
    var id: Int
    var name: String
    var cityName : String
    var shortDescription: String
    var description: String
    var starReview: Int
    var url: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var detailImageNames : [String]
    
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

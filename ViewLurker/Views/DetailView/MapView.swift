/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vo Khai Minh
  ID: s3879953
  Created  date: 04/08/2023.
  Last modified: 04/08/2023.
  Acknowledgement:
  A Detail View for Locations - Swiftful Thinking
  https://www.youtube.com/watch?v=SG7P1x5Yr7A&list=LL&index=1
*/

import SwiftUI
import MapKit

struct MapView: View {
    var destination: Destination
    var coordinates: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [destination]) { destination in
            MapAnnotation(coordinate: destination.locationCoordinate) {
                VStack {
                    Image(systemName: "mappin.circle.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(destination: destinations[0], coordinates: CLLocationCoordinate2D(latitude: 34.011_0286, longitude: -116.166_868))
    }
}

//
//  MapView.swift
//  ViewLurker
//
//  Created by Minh Vo on 04/08/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    var destination: Destination
    var coordinates: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))), annotationItems: [destination]) { destination in
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

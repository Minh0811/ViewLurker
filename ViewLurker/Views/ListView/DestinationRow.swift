//
//  DestinationRow.swift
//  ViewSeeker
//
//  Created by Minh Vo on 30/07/2023.
//

import SwiftUI

struct DestinationRow: View {
    var destination : Destination
    var body: some View {
        Text(destination.name)
    }
}

struct DestinationRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DestinationRow(destination: destinations[0])
                .previewLayout(.fixed(width: 300, height: 70))
            DestinationRow(destination: destinations[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
       
    }
}

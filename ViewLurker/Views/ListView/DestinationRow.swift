//
//  DestinationRow.swift
//  ViewSeeker
//
//  Created by Minh Vo on 30/07/2023.
//

import SwiftUI

struct DestinationRow: View {
    var destination: Destination
    var isDark: Bool = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(isDark ? Color.black : Color.white)
                .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 4)
            
            HStack(spacing: 8) { // Align content to the top (vertically)
                destination.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 140)
                    .clipShape(Rectangle())
                
                VStack(alignment: .leading) { // Align content to the leading edge (left)
                    Text(destination.name)
                        .lineLimit(1) // Limit the text to a single line
                        .font(.headline) // Use a preferred font style
                        .offset(y:-20)
                    Text(destination.shortDescription)
                        .padding(.bottom,10)
                        .offset(y:-15)
                    RatingView(destination: destination) // Use a preferred font style
                        .offset(x:20, y:15)
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Give the VStack a fixed width
                .padding()
            }
            .padding(8) // Add some padding around the HStack
        }
        .frame(width: 350, height: 150)
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
}

// ... (rest of the code remains the same)




struct DestinationRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DestinationRow(destination: destinations[0])
                .previewLayout(.fixed(width: 300, height: 70))
         
        }
        
    }
}

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vo Khai Minh
  ID: s3879953
  Created  date: 30/07/2023.
  Last modified: 02/08/2023.
  Acknowledgement:
*/

import SwiftUI

struct DestinationRowView: View {
    var destination: Destination
    var isDark: Bool = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(isDark ? Color.black : Color.white)
                .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 4)
            
            HStack(spacing: 8) {
                destination.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 140)
                    .clipShape(Rectangle())
                
                destinationContent
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .padding(8) // Add some padding around the HStack
        }
        .frame(width: 350, height: 150)
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
}


extension DestinationRowView {
    private var destinationContent: some View {
        ZStack() {
            VStack(alignment: .leading) {
                Text(destination.name)
                    .foregroundColor(isDark ? Color.white : Color.black)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .offset(y:-20)
                
                Text(destination.shortDescription)
                    .foregroundColor(isDark ? Color.white : .secondary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 10)
                    .offset(y:-15)
            }
            
            RatingView(destination: destination)
                .offset(y:55) // Adjust this to position the RatingView correctly
        }
    }


    
    
}

struct DestinationRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DestinationRowView(destination: destinations[0])
                .previewLayout(.fixed(width: 300, height: 70))
         
        }
        
    }
}

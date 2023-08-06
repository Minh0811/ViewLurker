/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vo Khai Minh
  ID: s3879953
  Created  date: 30/07/2023.
  Last modified: 30/07/2023.
  Acknowledgement:
*/

import SwiftUI

struct RatingView: View {
    var destination: Destination
    
    var label: String = ""
    var maximumRating: Int = 5
    var offImage: Image? = nil
    var onImage: Image = Image(systemName: "star.fill")
    var offColor: Color = Color.gray
    var onColor: Color = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1...maximumRating, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > min(destination.starReview, maximumRating) ? offColor : onColor)
            }
        }
    }
    
    private func image(for number: Int) -> Image {
        return number > min(destination.starReview, maximumRating) ? (offImage ?? onImage) : onImage
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(destination: destinations[0])
    }
}

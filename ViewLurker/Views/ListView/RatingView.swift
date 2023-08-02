//
//  RatingView.swift
//  ViewLurker
//
//  Created by Minh Vo on 01/08/2023.
//

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

//
//  DetailView.swift
//  ViewLurker
//
//  Created by Minh Vo on 03/08/2023.
//

import SwiftUI

struct DetailView: View {
    var destination: Destination
    var isDark: Bool = false
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16){
                titleSection
                Divider()
                descriptionSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
            DetailView(destination: destinations[0])

    }
}

extension DetailView {
    private var imageSection: some View {
        TabView{
            ForEach(destination.detailImageNames, id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 750, height: 600)
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height:500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(destination.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(destination.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(destination.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
     
            if let url = URL(string: "https://hotpot.ai/icon-resizer"){
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
}

//
//  DetailView.swift
//  ViewLurker
//
//  Created by Minh Vo on 03/08/2023.
//

import SwiftUI
import MapKit

struct DetailView: View {
    //For back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var destination: Destination
    var isDark: Bool = false
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    var body: some View {
        ScrollView{
                VStack{
                    ZStack{
                        customBackButton
                            .cornerRadius(3)
                        imageSection
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    }
                    VStack(alignment: .leading, spacing: 16){
                        titleSection
                        Divider()
                        descriptionSection
                        MapView(destination: destination, coordinates: destination.locationCoordinate)
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(25)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            
        }
        .ignoresSafeArea()
        .toolbarBackground(.hidden, for: .navigationBar)
        .background(isDark ? Color.black : Color.white)
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(destination: destinations[0])
        //WelcomeView()
        
    }
}

extension DetailView {
    
    private var customBackButton: some View {
        Spacer()
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarLeading)  {
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        ZStack{
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 40, height: 40)
                            Image(systemName: "multiply.square.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        }
                        
                        
                    })
                }
            })
    }
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
    
//    private var mapLayer: some View{
//
//    }
}

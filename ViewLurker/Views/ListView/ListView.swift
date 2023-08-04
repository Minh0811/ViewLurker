//
//  ListView.swift
//  ViewLurker
//
//  Created by Minh Vo on 01/08/2023.
//

import SwiftUI

struct ListView: View {
    
    @AppStorage("isDarkMode") private var isDark = false
    @State private var searchText = ""
    var body: some View {
        
        ZStack {
            if isDark{
                Color.black.edgesIgnoringSafeArea(.all)
            }
            
            VStack {
                // section header
                HStack {
                    Text("Seek your adventure")
                        .font(.system(size: 30))
                        .padding(.leading, 20)
                    
                    Button(action: {isDark.toggle()}, label:{
                        isDark ? Label ("", systemImage:"lightbulb.fill")
                        : Label ("", systemImage:"lightbulb")
                    })
                    .font(.system(size: 30))
                    .padding(.leading, 30)
                    Spacer()
                }
                .padding(.bottom, 2)
                .padding(.leading, 10)
                
                //List of items
                ScrollView{
                    VStack {
                        ForEach(searchResults, id: \.id) { destination in NavigationLink{
                            DetailView(destination: destination, isDark: isDark)
                        } label: {
                            DestinationRowView(destination: destination, isDark: isDark)
                                .padding([.top, .bottom], 10)
                                .padding([.trailing, .leading], 10)
                            
                        }
                        }
                        Spacer()
                    }
                }
            }
            .environment(\.colorScheme, isDark ? .dark : .light)
            .searchable(text: $searchText)
            
            //Search Bar
            var searchResults: [Destination] {
                if !(searchText.isEmpty) {
                    return destinations.filter {
                        $0.name.lowercased().contains(searchText.lowercased())
                    }
                } else {
                    
                    return destinations
                }
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

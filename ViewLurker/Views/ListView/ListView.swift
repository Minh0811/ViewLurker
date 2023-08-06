/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vo Khai Minh
  ID: s3879953
  Created  date: 01/08/2023.
  Last modified: 06/08/2023.
  Acknowledgement:
 Menu With Dark Mode Toggle Switch - Kavsoft
 https://www.youtube.com/watch?v=Rnj_omjZmQ4&t=453s
 Searching and Sorting - azamsharp
 https://www.youtube.com/watch?v=hMZdRduyA_4
*/

import SwiftUI

struct ListView: View {
    
    @AppStorage("isDarkMode") private var isDark = false
    @State private var searchText = ""
    @State private var sortOrder: SortOrder = .ascending

    enum SortOrder {
        case ascending
        case descending
    }
    //Search Bar
    func sortedDestinations(_ destinations: [Destination]) -> [Destination] {
        return destinations.sorted { (destination1: Destination, destination2: Destination) -> Bool in
            switch sortOrder {
            case .ascending:
                return destination1.starReview < destination2.starReview
            case .descending:
                return destination1.starReview > destination2.starReview
            }
        }
    }

    var searchResults: [Destination] {
        let filteredDestinations: [Destination]
        if !searchText.isEmpty {
            filteredDestinations = destinations.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            filteredDestinations = destinations
        }

        return sortedDestinations(filteredDestinations)
    }
    var body: some View {
        
        ZStack {
            if isDark{
                Color.black.edgesIgnoringSafeArea(.all)
            }
            
            VStack {
                // section header
                sectionHeader
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
                            
                        }}
                        Spacer()
                    }
                }
            }
            .environment(\.colorScheme, isDark ? .dark : .light)
            .searchable(text: $searchText)
        }
    }
}

extension ListView {
    private var sectionHeader: some View {
       HStack {
           Text("Seek your adventure")
               .font(.system(size: 30))
               .padding(.leading, 20)
           
           Button(action: {
               toggleSortOrder()
           }, label: {
               Image(systemName: sortOrder == .ascending ? "arrow.up" : "arrow.down")
                   .font(.system(size: 30))
                   .padding(.leading, 10)
           })
           
           Button(action: {isDark.toggle()}, label:{
               isDark ? Label ("", systemImage:"lightbulb.fill")
               : Label ("", systemImage:"lightbulb")
           })
           .font(.system(size: 30))
           
           Spacer()
       }
    }

    func toggleSortOrder() {
        sortOrder = sortOrder == .ascending ? .descending : .ascending
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

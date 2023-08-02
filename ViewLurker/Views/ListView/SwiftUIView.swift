import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
}

struct ContentView: View {
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 16) // Adjust the corner radius as needed
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 4) // Adjust the shadow properties as needed
                HStack{
                    
                }
                
                
                
                
            }
            .frame(width: 300, height: 150) // Adjust the size of the box as needed
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
              .previewLayout(.sizeThatFits)
              .padding()
    }
}

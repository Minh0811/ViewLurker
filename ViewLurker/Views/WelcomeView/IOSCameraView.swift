/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vo Khai Minh
  ID: s3879953
  Created  date: 28/07/2023.
  Last modified: 29/08/2023.
  Acknowledgement:
*/

import SwiftUI

struct IOSCameraView: View {
    @State private var showAlert: Bool = false
    var body: some View {
        NavigationView {
            ZStack{
                LoopingBackground()
                middleContent
                VStack{
                    //Top bar
                    topBar
                    
                    // Bottom bar
                    bottomBar
                }
            }
        }
    }
}

extension IOSCameraView {
    private var topBar: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black.opacity(0.5))
                .frame(height: 160)
                .offset(y:-300)
            HStack(spacing: 20){
                    Image(systemName: "gearshape")
                        .foregroundColor(.white)
                        .font(.system(size: 21))
                Spacer()
            
                    Image(systemName: "chevron.up.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 21))
                Spacer()
                
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 21))
                
            }
            .offset(y:-260)
            .padding(.horizontal, 20)
        }
    }
    
    private var middleContent: some View {
        
        ZStack{
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .offset(y:-210)
            Text("ViewLurker")
                .font(.custom("Georgia", size: 25))
                .foregroundColor(Color(red: 1, green: 0.9647058823529412, blue: 0.8627450980392157))
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                .offset(y:-140)
            Text("\"Seek the Lost, Frame Timeless Essence\"")
                .font(.custom("Georgia", size: 35))
                .foregroundColor(Color(red: 1, green: 0.9647058823529412, blue: 0.8627450980392157))
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                .offset(y:-60)
            
            VStack{
                Text("Take a picture for your adventure")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()

                Image(systemName: "chevron.forward.2")
                    .foregroundColor(.white)
                    .font(.system(size: 21))
                    .rotationEffect(.degrees(90))
            }
            .offset(y:200)
        }
    }
    
    
    
    
    
    private var bottomBar: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.black.opacity(0.5))
                .frame(height: 180)
                .offset(y:250)
            HStack(spacing: 20){
                Text("CINEMATIC")
                Text("VIDEO")
                Text("PHOTO")
                    .foregroundColor(.yellow)
                Text("PORTRAIT")
                Text("PANO")
            }
            .foregroundColor(.white)
            .offset(y:185)
            .padding(.horizontal, 10)
            .padding(.trailing,14)
            .font(Font.system(size: 14, weight: .regular))
            
            HStack(spacing: 20){
                
                
                Button(action: { showAlert = true }) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("This is ViewLurker"), message: Text("Vo Khai Minh(s3879953) at your service"), dismissButton: .default(Text("Be lost to the abyss.")))
                }
                
                Spacer()
                NavigationLink(
                    destination: ListView(),
                    label: {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 70))
                            .offset(x:-12)
                    }
                )
                
                Spacer()
                Button(action: {}){
                    Image(systemName: "repeat")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
            }
            .offset(y:250)
            .padding(.horizontal, 20)
        }
    }
}




struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        IOSCameraView()
    }
}

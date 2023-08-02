//
//  SwiftUIView.swift
//  ViewSeeker
//
//  Created by Minh Vo on 28/07/2023.
//

import SwiftUI

struct IOSCamera: View {
    var body: some View {
        NavigationView {
            ZStack{
                LoopingBackground()
                VStack{
                    //Top bar
                    ZStack{
                        
                        Rectangle()
                            .foregroundColor(.black.opacity(0.5))
                            .frame(height: 160)
                            .offset(y:-300)
                        
                        
                        HStack(spacing: 20){
                            Button(action: {}){
                                Image(systemName: "gearshape")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21))
                            }
                            
                            Spacer()
                            Button(action: {}){
                                Image(systemName: "chevron.up.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21))
                                
                            }
                            
                            Spacer()
                            Button(action: {}){
                                Image(systemName: "bolt.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21))
                            }
                        }
                        .offset(y:-270)
                        .padding(.horizontal, 20)
                    }
                    
                    
                    // Bottom bar
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
                        .padding(.trailing,20)
                        .font(Font.system(size: 14, weight: .regular))
                        
                        HStack(spacing: 20){
                            Button(action: {}){
                                Image(systemName: "gearshape")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                            }
                            
                            Spacer()
                            
                            NavigationLink(
                                destination: ListView(), // You can set the
                                label: {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 70))
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
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        IOSCamera()
    }
}

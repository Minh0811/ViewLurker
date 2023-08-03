//
//  ContentView.swift
//  ViewSeeker
//
//  Created by Minh Vo on 26/07/2023.
//

import SwiftUI

struct WelcomeView: View {
    @State var isActive : Bool = true
    var body: some View {
            IOSCameraView()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


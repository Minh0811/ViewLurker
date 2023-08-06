/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vo Khai Minh
  ID: s3879953
  Created  date: 26/07/2023.
  Last modified: 27/07/2023.
  Acknowledgement:
*/

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


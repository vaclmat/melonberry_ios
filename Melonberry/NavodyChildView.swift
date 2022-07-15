//
//  NavodyChildView.swift
//  Melonberry
//
//  Created by Václav Matoušek on 15.12.2021.
//

import SwiftUI
import NavigationStack

struct NavodyChildView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mediaresult: VnalStore
    var body: some View {
        ZStack {
            Color.blue
            NavigationStackView {
            List(mediaresult.vnals) { su in
                PushView(destination: VideoView(tsurl: su.linktv)
                        .navigationBarTitle("Videa", displayMode: .inline)
                        .navigationViewStyle(StackNavigationViewStyle()))
                 {
                     Text(su.videoname)
                        .bold()
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}
}

struct NavodyChildView_Previews: PreviewProvider {
    static var previews: some View {
        NavodyChildView()
    }
}

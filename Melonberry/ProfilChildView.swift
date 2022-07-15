//
//  ProfilChildView.swift
//  Melonberry
//
//  Created by Václav Matoušek on 09.12.2021.
//

import SwiftUI

struct ProfilChildView: View {
    @EnvironmentObject var stbiresult: UserStore
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var body: some View {
        VStack(alignment: .leading) {
//            HStack {
                Text("Jmeno a prijmeni: ")
                    .bold()
                    .padding()
                TextField("Zadej jmeno a prijmeni: ", text: $stbiresult.ress.name)
                    .autocapitalization(.none)
                    .padding()
                    .background(lightGreyColor)
                    .border(Color.black)
                    .cornerRadius(5.0)
                    .disabled(true)
//            }
//            HStack {
                Text("Uzivatelske jmeno: ")
                    .bold()
                    .padding()
                TextField("Zadej uzivatelske jmeno: ", text: $stbiresult.ress.slug)
                    .autocapitalization(.none)
                    .padding()
                    .background(lightGreyColor)
                    .border(Color.black)
                    .cornerRadius(5.0)
                    .disabled(true)
//            }
        }
    }
}

struct ProfilChildView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilChildView()
    }
}

//
//  ContentView.swift
//  Melonberry
//
//  Created by Václav Matoušek on 24.11.2021.
//

import SwiftUI
import SwiftKeychainWrapper
import Alamofire
import AVKit
import AVFoundation
import NavigationStack

class UserStore: ObservableObject {
    @Published var ress: UserRec = UserRec()
}

class VipStore: ObservableObject {
    @Published var vips: [VipRec] = [VipRec]()
}

class VnalStore: ObservableObject {
    @Published var vnals: [VnalRec] = [VnalRec()]
}

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var username: String
    @Binding var passwd: String
    @State var alertmsg: String
    @State var ashA: Bool = false
    @State private var selection = 0
    @State private var resetNavigationID = UUID()
    @ObservedObject var resus = UserStore()
    @State var isProfilLinkActive = false
    @ObservedObject var mesus = VipStore()
    @ObservedObject var vnalus = VnalStore()
    @State var isNavodyLinkActive = false
    
    var body: some View {
    
        let selectable = Binding(get: { self.selection }, set: { self.selection = $0
            self.resetNavigationID = UUID()
        })
        
        return TabView(selection: selectable) {
            self.tab1()
                .tabItem {
                    Label("Návody", systemImage: "video.circle.fill")
                }
                .tag(0)
            self.tab2()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle")
                }
                .tag(1)
            self.tab3()
                .tabItem {
                    Label("Odhlásit", systemImage: "square.and.arrow.up")
                }
                .tag(2)
            }
            .onAppear() {
                UITabBar.appearance().barTintColor = .blue
            }
            .accentColor(.red)
    }
    private func tab1() -> some View {
        NavigationStackView {
        VStack {
            NavigationLink(destination: NavodyChildView()
                            .environmentObject(vnalus)
                            .navigationBarTitle("Navody", displayMode: .automatic)
                            .navigationViewStyle(StackNavigationViewStyle())
                           //                            .navigationBarBackButtonHidden(true)
                           ,isActive: $isNavodyLinkActive )
                { EmptyView() }
                Button(action: {
                    isNavodyLinkActive = true
                    let rtoken: String? = KeychainWrapper.standard.string(forKey: "token")
                    let ruser: String? = KeychainWrapper.standard.string(forKey: "user")
                    let rurl: URLConvertible = "http://melonberry.local/wp-json/mo/v1/vip/" + ruser!
                    let headersr: HTTPHeaders = ["Accept":"application/json",
                     "Content-Type":"application/json", "Authorization": "Bearer " + rtoken!]
                    AF.request(rurl,
                            method: .get,
                            headers: headersr
                    ).responseDecodable(of: [VipRec].self)  {
                            (response) in
                            switch response.result {
                            case .success(let mediastr): do {
                                mesus.vips = mediastr
                                var avnal:[VnalRec] = []
                                for rvid in mesus.vips {
                                    let rvurl: URLConvertible = "http://melonberry.local/wp-json/mo/v1/vnal/" + rvid.vid
                                    AF.request(rvurl,
                                            method: .get,
                                            headers: headersr
                                    ).responseDecodable(of: [VnalRec].self)  {
                                            (response) in
                                            switch response.result {
                                            case .success(let vnalstr): do {
                                                avnal.append(contentsOf: vnalstr)
                                                self.vnalus.vnals = avnal
                                            }
                                            case .failure( let vnalerr): do {
                                                alertmsg = "Ziskani dat selhalo."
                                                print(vnalerr)
                                                ashA = true
                                            }}}}
                                }
                            case .failure( let mediaerr): do {
                                alertmsg = "Ziskani dat selhalo."
                                print(mediaerr)
                                ashA = true
                            }}}},
            label: {
                Image(systemName: "video")
                Text("Navody")
            })
            .alert(isPresented: self.$ashA, content: {
                Alert(title: Text( "Zpráva ze stránky Registrace uživatele"), message: Text(alertmsg),
                      dismissButton: .cancel())
            })
    }}}
    
    private func tab2() -> some View {
        NavigationView {
            VStack {
            NavigationLink(destination: ProfilChildView()
                            .environmentObject(resus)
                            .navigationBarTitle("Profil", displayMode: .inline)
//                            .navigationBarBackButtonHidden(true)
                           ,isActive: $isProfilLinkActive )
                { EmptyView() }
                Button(action: {
                    isProfilLinkActive = true
                    let rtoken: String? = KeychainWrapper.standard.string(forKey: "token")
                    let headersr: HTTPHeaders = ["Accept":"application/json",
                     "Content-Type":"application/json", "Authorization": "Bearer " + rtoken!]
                    AF.request("http://melonberry.local/wp-json/wp/v2/users/me",
                            method: .get,
                            headers: headersr
                    ).responseDecodable(of: UserRec.self)  {
                            (response) in
                            switch response.result {
                            case .success(let datastr): do {
                                self.resus.ress = datastr

                                print(self.resus.ress.name)

                            }
                            case .failure( _): do {
                                alertmsg = "Ziskani Vasich udaju selhalo."
                                ashA = true
                            }
                            }}},
            label: {
                Image(systemName: "person")
                Text("Profil")
            })
            .alert(isPresented: self.$ashA, content: {
                Alert(title: Text( "Zpráva ze stránky Registrace uživatele"), message: Text(alertmsg),
                      dismissButton: .cancel())
            })
            }
        }
    }
        
    private func tab3() -> some View {
        Button("Odhlásit") {
            self.username = ""
            self.passwd = ""
            let _: Bool = KeychainWrapper.standard.set("", forKey: "token")
            let _: Bool = KeychainWrapper.standard.set("", forKey: "username")

            self.presentationMode.wrappedValue.dismiss()
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(width: 220, height: 60, alignment: .center)
        .background(Color.green)
        .cornerRadius(15.0)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(username: .constant(""), passwd: .constant(""), alertmsg: "")
    }
}

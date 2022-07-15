//
//  LogRegView.swift
//  Melonberry
//
//  Created by Václav Matoušek on 24.11.2021.
//

import SwiftUI
import Alamofire
import SwiftKeychainWrapper
import JWTDecode

struct LogRegView: View {
    @State var isLoginActive = false
    @State var isRegActive = false
    @State var showingAlert = false
    @State var username = ""
    @State var passwd = ""
    @State var alertmessage = ""
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    var body: some View {
        NavigationView {
            VStack{
            WelcomeText()
            UserImage()
            TextField("Uživatelské jméno", text: $username)
                .autocapitalization(.none)
                .padding()
                .background(lightGreyColor)
                .border(Color.black)
                .cornerRadius(5.0)
                .padding(.leading)
                .padding(.trailing)
            SecureField("Heslo", text: $passwd)
                .padding()
                .background(lightGreyColor)
                .border(Color.black)
                .cornerRadius(5.0)
                .padding(.leading)
                .padding(.trailing)
            NavigationLink(
                destination: ContentView(username: $username, passwd: $passwd, alertmsg: alertmessage)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("Vitejte v Melonberry", displayMode: .inline),
                isActive: $isLoginActive) {
                Button(action: {
                
                
                
                if ( username == "" || passwd == "") {
                    alertmessage = "Pro přihlášení vyplň uživatelské jméno a heslo!"
                    showingAlert = true
                    } else {
                let logins = Log_in(username: username, password: passwd)
//                print(logins)
                let headers: HTTPHeaders = ["Accept":"application/json",
                     "Content-Type":"application/json"]
                AF.request("http://melonberry.local/wp-json/jwt-auth/v1/token",
                           method: .post,
                           parameters: logins,
                           encoder: JSONParameterEncoder.default,
                           headers: headers
                )
                .responseDecodable(of: Tk.self) {
                    (response) in
                    switch response.result {
                    case .success(let tokenstr):
                        let utoken = tokenstr.data.token
//                        print("Token String: \(utoken)")
                        let _: Bool = KeychainWrapper.standard.set(utoken, forKey: "token")
                        let _: Bool = KeychainWrapper.standard.set(username, forKey: "user")
                        self.isLoginActive = true
                    case .failure(let fail):
                        alertmessage = "Authentication failed"
                        showingAlert = true
                        print("error: \(fail)")
                    }}
                    }}) {
                LoginButtonContent()
                    }
                .alert(isPresented: self.$showingAlert, content: {
                Alert(title: Text( "Authentication failure"), message: Text(alertmessage),
                      dismissButton: .cancel())
            })
            }
        NavigationLink(
            destination: RegView(rusername: "", rfirst_name: "", rlast_name: "", remail: "", rpassword: "", alertmsg: "")
            .navigationBarBackButtonHidden(true)
                .navigationBarTitle("Registration View", displayMode: .inline),
            isActive: $isRegActive) {
                Button(action:{ self.isRegActive = true }) {
                    RegButtonContent()
                        }          .padding()
        
    }
    }
}
}

struct LogRegView_Previews: PreviewProvider {
    static var previews: some View {
            LogRegView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}

struct WelcomeText: View {
    var body: some View {
        return Text("Melonberry")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 0)
    }
}

struct UserImage: View {
    var body: some View {
        return Image("melonbery_img")
            .resizable()
            .aspectRatio(UIImage(named: "melonbery_img")!.size, contentMode: .fill)
            .frame(width: 200, height: 100, alignment: .center)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 0)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        return Text("Přihlášení")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60, alignment: .center)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}
struct RegButtonContent: View {
   var body: some View {
      return Text("Registrace")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60, alignment: .center)
                .background(Color.green)
                .cornerRadius(15.0)
   }
}
    }

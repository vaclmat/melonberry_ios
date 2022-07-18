//
//  RegView.swift
//  Melonberry
//
//  Created by Václav Matoušek on 24.11.2021.
//

import SwiftUI
import SwiftKeychainWrapper
import Alamofire

struct RegView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var rusername: String
    @State var rfirst_name: String
    @State var rlast_name: String
    @State var remail: String
    @State var rpassword: String
    @State var alertmsg: String
    @State var ashA: Bool = false
    @State var isLoginActive = false
    @State var showingAlert = false
    @State var alertmessage = ""
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Group{
            HStack{
                Text("Uživatelské  jméno:")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading)
                    .padding(.bottom, -15)
            }
            HStack{
                TextField("Zadej uživatelské jméno", text: $rusername)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(5.5)
                    .background(lightGreyColor)
                    .cornerRadius(15.0)
                    .border(Color.black)
                    .padding(.leading)
                    .padding(.trailing)
            }
            }
            Group{
                HStack{
                Text("Jméno:")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading)
                    .padding(.bottom, -15)
                }
            HStack{
                TextField("Zadej jméno", text: $rfirst_name)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(5.5)
                    .background(lightGreyColor)
                    .border(Color.black)
                    .cornerRadius(5.0)
                    .padding(.leading)
                    .padding(.trailing)
            }
            }
            Group{
                HStack{
                Text("Příjmení:")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading)
                    .padding(.bottom, -15)
                }
            HStack{
                TextField("Zadej příjmení", text: $rlast_name)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(5.5)
                    .background(lightGreyColor)
                    .border(Color.black)
                    .cornerRadius(5.0)
                    .padding(.leading)
                    .padding(.trailing)
            }
            }
            Group{
            HStack{
                Text("Email: ")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading)
                    .padding(.bottom, -15)
            }
            HStack{
                TextField("Zadej email", text: $remail)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(5.5)
                    .background(lightGreyColor)
                    .border(Color.black)
                    .cornerRadius(5.0)
                    .padding(.leading)
                    .padding(.trailing)
            }
            }
            Group{
            HStack{
                Text("Heslo: ")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading)
                    .padding(.bottom, -15)
            }
              HStack{
                TextField("Zadej heslo", text: $rpassword)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(5.5)
                    .background(lightGreyColor)
                    .border(Color.black)
                    .cornerRadius(5.0)
                    .padding(.leading)
                    .padding(.trailing)
            }
            }
            Divider()
            VStack(alignment: .center) {
                Button(action: {
                    if (rfirst_name == "" || rlast_name == "" || remail == "" || rusername == "" || rpassword == "") {
                        alertmsg = "Vyplňte prosím všechny položky"
                        ashA = true
                    } else {
//Přihlášení jako reguser
                        var username = "reguser"
                        var passwd = "reguserpwd"
                        let logins = Log_in(username: username, password: passwd)
                        print(logins)
                        let headers: HTTPHeaders = ["Accept":"application/json",
                             "Content-Type":"application/json"]
                        AF.request(Constants.web_url + "wp-json/jwt-auth/v1/token",
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
                                print("Token String: \(utoken)")
                                let _: Bool = KeychainWrapper.standard.set(utoken, forKey: "token")
                                let _: Bool = KeychainWrapper.standard.set(username, forKey: "user")
                                self.isLoginActive = true
                            case .failure(let fail):
                                alertmessage = "Authentication failed"
                                showingAlert = true
                                print("error: \(fail)")
                            }}
                        let rtoken: String? = KeychainWrapper.standard.string(forKey: "token")
                        let headersr: HTTPHeaders = ["Accept":"application/json",
                         "Content-Type":"application/json", "Authorization": "Bearer " + rtoken!]
                        let addp = Wp_user(username: rusername, first_name: rfirst_name, last_name: rlast_name, email: remail, roles: "subscriber", password: rpassword);                        AF.request(Constants.web_url + "wp-json/wp/v2/users",
                               method: .post,
                               parameters: addp,
                               encoder: JSONParameterEncoder.default,
                               headers: headersr
                               ).response  {
                                (response) in
                                switch response.result {
                                case .success( _): do {
                                    alertmsg = "Uživatel " + rusername + " byl úspěšně přidán. Videa k Vámi zakoupeným produktům budou přístupná do 2 pracovních dnů"
                                    ashA = true
                                    rusername = ""
                                    rfirst_name = ""
                                    rlast_name = ""
                                    remail = ""
                                    rpassword = ""
                                    username = ""
                                    passwd = ""
                                    let _: Bool = KeychainWrapper.standard.set("", forKey: "token")
                                    let _: Bool = KeychainWrapper.standard.set("", forKey: "username")
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                case .failure( _): do {
                                    alertmsg = "Zadání Vašich uživatelských údajů selhalo. Zkuste později nebo informujte správce webu melonberry."
                                    ashA = true
                                }}}}
                }, label: {
                Text("Registrace uživatele")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(5.5)
                    .frame(width: 220, height: 60, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .padding(.leading)
                })
                .alert(isPresented: self.$ashA, content: {
                    Alert(title: Text( "Zpráva ze stránky Registrace uživatele"), message: Text(alertmsg),
                          dismissButton: .cancel())
                })
                
            }
        }
    }
}

struct RegView_Previews: PreviewProvider {
    static var previews: some View {
        RegView(rusername: "", rfirst_name: "", rlast_name: "", remail: "", rpassword: "", alertmsg: "")
    }
}

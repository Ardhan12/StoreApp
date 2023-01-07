//
//  loginView.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 03/01/23.
//

import SwiftUI

struct loginView: View {
    
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongPassword = 0
    @State private var wrongUsername = 0
    @State private var showLoginScreen = false
    @State private var textFail = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("Login")
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    
                    TextField("username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login"){
                        
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        AutheticateUser(username: username, password: password)
                    }.foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding()
                    
                    NavigationLink(destination: ViewHome(), isActive: $showLoginScreen){
                        
                    }.navigationBarBackButtonHidden(true)
                    
                    Text(textFail ? "Login gagal, periksa kembali username/password Anda”": "")
                        .font(.caption)
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    func AutheticateUser(username: String, password: String){
        if username.lowercased() == "pitjarus" {
            wrongUsername = 0
            textFail = false
            if password.lowercased() == "admin" {
                wrongPassword = 0
                showLoginScreen = true
                textFail = false
            } else {
                wrongPassword = 2
                textFail = true
            }
        } else {
            wrongUsername = 2
            textFail = true
        }
    }
}

struct ViewHome : UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewHome>) -> UIViewController {
        let home = ViewController()
        return home
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewHome>) {
        // Update your UIKit view controller here, if needed
        uiViewController.navigationItem.leftBarButtonItem = nil
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}

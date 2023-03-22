//
//  AuthorizationService.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 21.03.2023.
//

import SwiftUI

final class AuthorizationService: ObservableObject {
    
    @AppStorage("AUTH_KEY") var authenticated = false { willSet { objectWillChange.send() } }
    @AppStorage("USER_FIRSTNAME", store: .standard) var firstname = ""
    @AppStorage("USER_LASTNAME", store: .standard) var lastname = ""
    @AppStorage("USER_EMAIL", store: .standard) var email = ""
    
    @Published var inputFirstName = ""
    @Published var inputLastname = ""
    @Published var inputEmail = ""
    
    // debug
    private var sampleFirstName = "firstname"
    private var samplelastName = "lastname"
    private var sampleEmail = "email"
    private var samplePassword = "password"
    
    @Published var password = ""
    @Published var invalid: Bool = false
    @Published var isUserAlreadyExist: Bool = false
    
    var isSignUpComplete: Bool {
        if !isEmailValid() || inputFirstName.isEmpty || inputLastname.isEmpty {
            return false
        }
        return true
    }
    
    func toggleAuthentication(isAuth: Bool) {
        self.password = ""
        withAnimation(.spring()) {
            authenticated = isAuth
        }
    }
    
    func signInAuthenticate() {
        inputValuesCheck()
        
        if !isUserAlreadyExist {
            self.firstname = inputFirstName
            self.lastname = inputLastname
            self.email = inputEmail
            toggleAuthentication(isAuth: true)
        }
    }
    
    func logInAuthenticate() {
        if self.firstname.lowercased() == UserDefaults.standard.string(forKey: "USER_FIRSTNAME")?.lowercased(),
           self.password.lowercased() == samplePassword {
            toggleAuthentication(isAuth: true)
            
        } else {
            self.invalid = true
            return
        }
    }
    
    func inputValuesCheck() {
        if inputFirstName == UserDefaults.standard.string(forKey: "USER_FIRSTNAME"),
           inputLastname == UserDefaults.standard.string(forKey: "USER_LASTNAME"),
           inputEmail == UserDefaults.standard.string(forKey: "USER_EMAIL") {
            self.isUserAlreadyExist = true
        }
    }
    
    func logOut() {
        toggleAuthentication(isAuth: false)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(
            format: "SELF MATCHES %@",
            "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: inputEmail)
    }
}

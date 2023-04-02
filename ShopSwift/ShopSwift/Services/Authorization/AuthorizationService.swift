//
//  AuthorizationService.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 21.03.2023.
//

import SwiftUI

final class AuthorizationService: ObservableObject {
    
    @AppStorage("AUTH_KEY") var authenticated: Bool = false {
        willSet { objectWillChange.send() }
    }
    
    @AppStorage("USER_FIRSTNAME", store: .standard) var firstname: String = ""
    @AppStorage("USER_LASTNAME", store: .standard) var lastname: String = ""
    @AppStorage("USER_EMAIL", store: .standard) var email: String = ""
    
    @Published var inputFirstName: String = ""
    @Published var inputLastname: String = ""
    @Published var inputEmail: String = ""
    @Published var password: String = ""
    
    @Published var isInvalidAuthorization: Bool = false
    @Published var isUserAlreadyExist: Bool = false
    @Published var isShowLogInSheetView: Bool = false
    
    // debug
    private var sampleFirstName: String = "firstname"
    private var samplelastName: String = "lastname"
    private var sampleEmail: String = "email"
    private var samplePassword: String = "password"
    
    var isSignUpComplete: Bool {
        if !isEmailValid() || inputFirstName.isEmpty || inputLastname.isEmpty {
            return false
        }
        return true
    }
    
    var isLogInComplete: Bool {
        if inputFirstName.isEmpty {
            return false
        }
        return true
    }
}

extension AuthorizationService {
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
        if self.inputFirstName.lowercased() == UserDefaults.standard.string(forKey: "USER_FIRSTNAME")?.lowercased(),
           self.password.lowercased() == samplePassword {
            toggleAuthentication(isAuth: true)
            
        } else {
            self.isInvalidAuthorization = true
            return
        }
    }
    
    func logOut() {
        toggleAuthentication(isAuth: false)
    }
}

private extension AuthorizationService {
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(
            format: "SELF MATCHES %@",
            "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: inputEmail)
    }
    
    func inputValuesCheck() {
        if inputFirstName == UserDefaults.standard.string(forKey: "USER_FIRSTNAME"),
           inputLastname == UserDefaults.standard.string(forKey: "USER_LASTNAME"),
           inputEmail == UserDefaults.standard.string(forKey: "USER_EMAIL") {
            self.isUserAlreadyExist = true
        }
    }
    
    func toggleAuthentication(isAuth: Bool) {
        self.password = ""
        withAnimation(.spring()) {
            authenticated = isAuth
        }
    }
}

//
//  AuthService.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation
import Firebase


class AuthService {
    
    static let instance = AuthService()
    
    //Registration
    
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping(_ status: Bool, _ error: Error?) -> () )  {
      
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider": user.user.providerID, "email": user.user.email]
            DataService.instance.createDBUser(uid: user.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
        
    }
    
    //Login
    
    func loginUser(withEmail email: String, andPassword password: String, userLoginComplete: @escaping(_ status: Bool, _ error: Error?) -> () ){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                userLoginComplete(false, error)
                return
            }
            userLoginComplete(true, nil)
        }
    }
}




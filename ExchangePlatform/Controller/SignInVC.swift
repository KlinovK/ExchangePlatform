//
//  SignInVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        let signInVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC")
        present(signInVC!, animated: true, completion: nil)
    }
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil &&
            passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
//                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
//                    if success {
//                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userLoginComplete: { (success, nil) in
//                            self.dismiss(animated: true, completion: nil)
//                            print("Success registration of user")
//                        })
//                    } else {
//                        print(String(describing: loginError?.localizedDescription))
//                    }
//                })
           }
       }
    }
    
}

extension SignInVC: UITextFieldDelegate {
    
}

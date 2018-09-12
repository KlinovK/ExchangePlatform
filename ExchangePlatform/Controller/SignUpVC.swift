//
//  SignUpVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    
    @IBOutlet weak var emailLbl: InsetTextField!
    @IBOutlet weak var passwordLbl: InsetTextField!
    @IBOutlet weak var addressLbl: InsetTextField!
    @IBOutlet weak var companyNameLbl: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailLbl.delegate = self
        passwordLbl.delegate = self
        
    }
    
    
    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        if emailLbl.text != nil &&
            passwordLbl.text != nil {
                        AuthService.instance.registerUser(withEmail: self.emailLbl.text!, andPassword: self.passwordLbl.text!, userCreationComplete: { (success, registrationError) in
                            if success {
                                AuthService.instance.loginUser(withEmail: self.emailLbl.text!, andPassword: self.passwordLbl.text!, userLoginComplete: { (success, nil) in
                                    self.dismiss(animated: true, completion: nil)
                                    print("Success registration of user")
                                })
                            } else {

                            }
                        })
        }
    }
}


    

extension SignUpVC: UITextFieldDelegate {
    
}

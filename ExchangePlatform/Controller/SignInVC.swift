//
//  SignInVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        let signInVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC")
        present(signInVC!, animated: true, completion: nil)
    }
    
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
    }
    
    
    
}

//
//  MeVCViewController.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/1/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
       let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure want to logout?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
               try Auth.auth().signOut()
                let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
                self.present(signInVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated:  true, completion: nil)
    }

}

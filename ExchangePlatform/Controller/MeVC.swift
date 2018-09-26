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
    @IBOutlet weak var myTableView: UITableView!
    
    var messageArray: [Message] = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
        DataService.instance.getAllFeedMessages { (returnMessagesArray) in
            self.messageArray = returnMessagesArray.reversed()
            self.myTableView.reloadData()
        }
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

extension MeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFeedCell") as? MyTableCell else
        {
            return UITableViewCell()
        }
        
        
        let image = UIImage(named: "user")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUserName(forUID: message.senderID) { (returnedUserName) in
            cell.configureMyTableCell(profileImage: image!, email: returnedUserName, content: message.content)
        }
        return cell
    }
}

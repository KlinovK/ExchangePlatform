//
//  CreateOrderVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/12/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class CreateOrderVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailSearchTxtField: InsetTextField!
    @IBOutlet weak var numberTxtField: InsetTextField!
    @IBOutlet weak var descriptionTxtField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var orderMemberLbl: UILabel!
    @IBOutlet weak var fromAddressTextField: InsetTextField!
    @IBOutlet weak var toAddressTextField: InsetTextField!
    
    var emailArray = [String]()
    var choosenUserArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTxtField.delegate = self
        emailSearchTxtField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneBtn.isHidden = true
    }
    
    @objc func textFieldDidChange(){
        if emailSearchTxtField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTxtField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if numberTxtField.text != "" && descriptionTxtField.text != "" && fromAddressTextField.text != "" && toAddressTextField.text != "" {
            DataService.instance.getIDs(forUsernames: choosenUserArray) { (idsArray) in
                var userIds = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createOrder(withNumber: self.numberTxtField.text!, andDescription: self.descriptionTxtField.text!, forUserIDs: userIds, fromAddress: self.fromAddressTextField.text!, toAddress: self.toAddressTextField.text!, handler: { (orderCreated) in
                    if orderCreated {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Order could not be created. Please try again.")
                    }
                })
            }
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension CreateOrderVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "user")
        if choosenUserArray.contains(emailArray[indexPath.row]) {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row] , isSelected: true)
        } else {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row] , isSelected: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !choosenUserArray.contains(cell.emailLbl.text!) {
            choosenUserArray.append(cell.emailLbl.text!)
            orderMemberLbl.text = choosenUserArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            choosenUserArray = choosenUserArray.filter({ $0 != cell.emailLbl.text! })
            if choosenUserArray.count >= 1 {
                orderMemberLbl.text = choosenUserArray.joined(separator: ", ")
            } else {
                orderMemberLbl.text = "add people to your order"
                doneBtn.isHidden = true
            }
        }
    }
    
    
}

extension CreateOrderVC: UITextFieldDelegate {
    
}

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
    @IBOutlet weak var fromAddressTextField: InsetTextField!
    @IBOutlet weak var toAddressTextField: InsetTextField!
    @IBOutlet weak var typeOfCargoTextField: InsetTextField!
    @IBOutlet weak var orderPriceTextField: InsetTextField!
    
    var emailArray = [String]()
    var choosenUserArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if numberTxtField.text != "" && descriptionTxtField.text != "" && fromAddressTextField.text != "" && toAddressTextField.text != "" {
            DataService.instance.getIDs(forUsernames: choosenUserArray) { (idsArray) in
                var userIds = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createOrder(withNumber: self.numberTxtField.text!, andDescription: self.descriptionTxtField.text!, orderPrice: self.orderPriceTextField.text!, typeOfCargo: self.typeOfCargoTextField.text! , forUserIDs: userIds, fromAddress: self.fromAddressTextField.text!, toAddress: self.toAddressTextField.text!, handler: { (orderCreated) in
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



extension CreateOrderVC: UITextFieldDelegate {
    
}

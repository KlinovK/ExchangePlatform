//
//  CreateTenderVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/1/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class CreateTenderVC: UIViewController {

    
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tenderNumberTextField: InsetTextField!
    @IBOutlet weak var firstPointTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var tenderPriceTextField: InsetTextField!
    @IBOutlet weak var addressToTextField: InsetTextField!
    
    @IBOutlet weak var typeOfCargoTextField: InsetTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
       dismiss(animated: true, completion: nil)
}
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if tenderNumberTextField.text != "" && descriptionTextField.text != "" && firstPointTextField.text != "" && addressToTextField.text != "" {
            DataService.instance.createTender(withNumber: self.tenderNumberTextField.text!, andDescription: self.descriptionTextField.text!, tenderPrice: self.tenderPriceTextField.text!, typeOfCargo: self.typeOfCargoTextField.text!, fromAddress: self.firstPointTextField.text!, toAddress: self.addressToTextField.text!) { (tenderCreated) in
                if tenderCreated {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("Tender could not be created. Please try again.")
                }
            }
        }
}
}


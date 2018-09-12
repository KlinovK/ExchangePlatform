//
//  CreateOrderVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/12/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class CreateOrderVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailSearchTxtField: InsetTextField!
    @IBOutlet weak var numberTxtField: InsetTextField!
    @IBOutlet weak var descriptionTxtField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var orderMemeberLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
    }
    

}

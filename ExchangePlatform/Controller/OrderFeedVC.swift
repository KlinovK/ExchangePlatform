//
//  OrderFeedVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/15/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class OrderFeedVC: UIViewController {

    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTxtField: InsetTextField!
    @IBOutlet weak var membersLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    }
    
}

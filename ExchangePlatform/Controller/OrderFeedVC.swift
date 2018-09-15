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
    
    var order: Order?
    
    
    func initData(forOrder order: Order){
        self.order = order
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        orderNumberLbl.text = order?.orderTitle
        DataService.instance.getEmailFor(order: order!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")

        }
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    }
    
}

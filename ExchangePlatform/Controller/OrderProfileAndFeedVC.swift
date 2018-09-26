//
//  OrderFeedVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/15/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class OrderProfileAndFeedVC: UIViewController {

    
    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTxtField: InsetTextField!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var orderPriceLbl: UILabel!
    @IBOutlet weak var addressFromLbl: UILabel!
    @IBOutlet weak var addressToLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var cargoTypeLbl: UILabel!
    @IBOutlet weak var secondOrderNumberLbl: UILabel!
    
    
    var order: Order?
    var orderMessages = [Message]()
    
    
    func initData(forOrder order: Order){
        self.order = order
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        orderNumberLbl.text = order?.ordernNumber
        secondOrderNumberLbl.text = order?.ordernNumber
        orderPriceLbl.text = order?.orderPrice
        addressFromLbl.text = order?.fromAddress
        addressToLbl.text = order?.toAddress
        descriptionLbl.text = order?.description
        cargoTypeLbl.text = order?.typeOfCargo
        DataService.instance.getEmailFor(order: order!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")

            
            if self.orderMessages.count > 0 {
                self.tableView.scrollToRow(at: IndexPath(row: self.orderMessages.count - 1, section: 0), at: .none, animated: true)
            }
        }
        DataService.instance.REF_ORDERS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredOrder: self.order!, handler: { (returnedOrderMessages) in
                self.orderMessages = returnedOrderMessages
                self.tableView.reloadData()
            })
        }
        
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTxtField.text != "" {
            messageTxtField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTxtField.text!, forUID: (Auth.auth().currentUser?.uid)!, withOrderKey: order?.key) { (complete) in
                if complete {
                    self.messageTxtField.text = ""
                   self.messageTxtField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            }
        }
    }
    
}

extension OrderProfileAndFeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderFeedCell", for: indexPath) as? OrderFeedCell else {return UITableViewCell()}
        let message = orderMessages[indexPath.row]
        DataService.instance.getUserName(forUID: message.senderID) { (email) in
            cell.configureCell(profileImage: UIImage(named:"user")!, email: email, content: message.content)

        }
        return cell
    }
}

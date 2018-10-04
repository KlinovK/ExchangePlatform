//
//  TenderProfileVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/1/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class TenderProfileVC: UIViewController {

    @IBOutlet weak var secondTenderNumberLbl: UILabel!
    @IBOutlet weak var firstTenderNumberLbl: UILabel!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextFieldLbl: InsetTextField!
    @IBOutlet weak var cargoTypeLbl: UILabel!
    @IBOutlet weak var toLbl: UILabel!
    @IBOutlet weak var fromLbl: UILabel!
    @IBOutlet weak var tenderPriceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var tender: Tender?
    var tenderMessages = [Message]()
    
    func initData(forTender tender: Tender){
        self.tender = tender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstTenderNumberLbl.text = tender?.tenderNumber
        secondTenderNumberLbl.text = tender?.tenderNumber
        tenderPriceLbl.text = tender?.tenderPrice
        fromLbl.text = tender?.fromAddress
        toLbl.text = tender?.toAddress
        descriptionLbl.text = tender?.description
        cargoTypeLbl.text = tender?.typeOfCargo
            
            if self.tenderMessages.count > 0 {
                self.tableView.scrollToRow(at: IndexPath(row: self.tenderMessages.count - 1, section: 0), at: .none, animated: true)
            }
        

        DataService.instance.REF_TENDERS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredTender: self.tender!, handler: { (returnedTenderMessages) in
                self.tenderMessages = returnedTenderMessages
                self.tableView.reloadData()
    })
        }
}
        
        
    
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextFieldLbl.text != "" {
            messageTextFieldLbl.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextFieldLbl.text!, forUID: (Auth.auth().currentUser?.uid)!, withOrderKey: tender?.key) { (complete) in
                if complete {
                    self.messageTextFieldLbl.text = ""
                    self.messageTextFieldLbl.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            }
        }
    }
    
}


extension TenderProfileVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tenderMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tenderFeedCell", for: indexPath) as? TenderFeedCell else {return UITableViewCell()}
        let message = tenderMessages[indexPath.row]
        DataService.instance.getUserName(forUID: message.senderID) { (email) in
            cell.configureCell(profileImage: UIImage(named:"user")!, email: email, content: message.content)
            
        }
        return cell
    }
}

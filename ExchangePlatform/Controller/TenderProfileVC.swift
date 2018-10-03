//
//  TenderProfileVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/1/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class TenderProfileVC: UIViewController {

    var tender: Tender?
    var tenderMessages = [Message]()
    
    func initData(forTender tender: Tender){
        self.tender = tender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
//        DataService.instance.getUserName(forUID: message.senderID) { (email) in
//            cell.configureCell(profileImage: UIImage(named:"user")!, email: email, content: message.content)
//            
//        }
        return cell
    }
}

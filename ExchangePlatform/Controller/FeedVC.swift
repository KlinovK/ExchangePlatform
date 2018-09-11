//
//  FirstViewController.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/27/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController {
    
 
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray: [Message] = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnMessagesArray) in
            self.messageArray = returnMessagesArray.reversed()
            self.tableView.reloadData()
        }
    }

}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else
        {
            return UITableViewCell()
        }
        
   
        let image = UIImage(named: "user")
        let message = messageArray[indexPath.row]

        DataService.instance.getUserName(forUID: message.senderID) { (returnedUserName) in
            cell.configureCell(profileImage: image!, email: returnedUserName, content: message.content)

        }
    return cell
}
}

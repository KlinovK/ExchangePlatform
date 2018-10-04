//
//  TenderFeedCell.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/3/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class TenderFeedCell: UITableViewCell {

    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var senderEmailLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.senderImage.image = profileImage
        self.senderEmailLbl.text = email
        self.messageLbl.text = content
    }

}

//
//  OrderFeedCell.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/15/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class OrderFeedCell: UITableViewCell {

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImg.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

}

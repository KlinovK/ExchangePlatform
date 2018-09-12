//
//  UserCell.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/12/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImg: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool){
        self.profileImg.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkImg.isHidden = false
        } else {
            self.checkImg.isHidden = true
        }
    }
    
    
}

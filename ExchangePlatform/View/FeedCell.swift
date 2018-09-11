//
//  FeedCell.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/4/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImg.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

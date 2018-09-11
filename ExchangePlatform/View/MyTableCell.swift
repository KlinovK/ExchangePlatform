//
//  MyTableCell.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/11/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {

    @IBOutlet weak var myTableCellImage: UIImageView!
    @IBOutlet weak var myTableCellEmailLbl: UILabel!
    @IBOutlet weak var myTableCellMessageLbl: UILabel!
    
    func configureMyTableCell(profileImage: UIImage, email: String, content: String){
        self.myTableCellImage.image = profileImage
        self.myTableCellEmailLbl.text = email
        self.myTableCellMessageLbl.text = content
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }



}

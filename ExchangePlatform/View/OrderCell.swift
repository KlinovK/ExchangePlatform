//
//  OrderCell.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/15/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var orderDescriptionLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(number: String, description: String, memberCount: Int) {
        self.orderNumberLbl.text = number
        self.orderDescriptionLbl.text = description
        self.memberCountLbl.text = "\(memberCount)"
    }
    
}

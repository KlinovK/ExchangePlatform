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
    @IBOutlet weak var addressTo: UILabel!
    @IBOutlet weak var addressFrom: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var typeOfCargoLbl: UILabel!
    
    
    func configureCell(number: String, orderPrice: String, typeOfCargo:String, description: String, memberCount: Int, addressFrom: String, addressTo: String) {
        self.orderNumberLbl.text = "Number: \(number)"
        self.orderDescriptionLbl.text = "Description: \(description)"
        self.memberCountLbl.text = "Members: \(memberCount)"
        self.addressFrom.text = "From: \(addressFrom)"
        self.addressTo.text = "To: \(addressTo)"
        self.orderPrice.text = "Price: \(orderPrice)"
        self.typeOfCargoLbl.text = "Type: \(typeOfCargo)"
    }
    
}

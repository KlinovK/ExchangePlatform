//
//  TenderCell.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/2/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class TenderCell: UITableViewCell {

    @IBOutlet weak var tenderNumberLbl: UILabel!
    @IBOutlet weak var tenderPriceLbl: UILabel!
    @IBOutlet weak var addressToLbl: UILabel!
    @IBOutlet weak var addressFromLbl: UILabel!
    @IBOutlet weak var tenderDescriptionLbl: UILabel!
    @IBOutlet weak var typeOfCargoLbl: UILabel!
    
    func configureCell(number: String, tenderPrice: String, typeOfCargo:String, description: String, addressFrom: String, addressTo: String) {
        self.tenderNumberLbl.text = "Number: \(number)"
        self.tenderDescriptionLbl.text = "Description: \(description)"
        self.addressFromLbl.text = "From: \(addressFrom)"
        self.addressToLbl.text = "To: \(addressTo)"
        self.tenderPriceLbl.text = "Price: \(tenderPrice)"
        self.typeOfCargoLbl.text = "Type: \(typeOfCargo)"
    }
    
    
    
}

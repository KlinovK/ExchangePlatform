//
//  DistanceAndPriceCalculator.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/31/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class DistanceAndPriceCalculator: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var priceTxTField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func segmentControlWasPressed(_ sender: Any) {
    }
    
    @IBAction func calculateBtnWasPressed(_ sender: Any) {
    }
    
}

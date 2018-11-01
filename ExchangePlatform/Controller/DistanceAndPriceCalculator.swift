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
        switch segmentControl.selectedSegmentIndex {
        case 0:
            descLbl.text = "Per km";
        case 1:
            descLbl.text = "Per transportation";
        default:
            break
        }
    }
    
    @IBAction func calculateBtnWasPressed(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
  //          resultLbl.text = ((priceTxTField.text)! as NSString).doubleValue * 2
        }
    }
    
}

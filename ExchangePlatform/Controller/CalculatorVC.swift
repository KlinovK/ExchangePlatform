//
//  DistanceAndPriceCalculator.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/31/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var priceTxTField: InsetTextField!
    
    var calcutate = CalcModel(distance: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculateResult()
        updateUI()
    }
    
    func calculateResult(){
        calcutate.distance = ((priceTxTField.text)! as NSString).doubleValue
        calcutate.calculateResult()
    }
    
    func updateUI(){
        resultLbl.text = String(format: "$%0.2f", calcutate.result)
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
        calculateResult()
        updateUI()
    }
    
}

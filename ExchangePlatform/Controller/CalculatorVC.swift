//
//  DistanceAndPriceCalculator.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/31/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var CurrencySegmentControl: UISegmentedControl!
    @IBOutlet weak var resultPerKMLbl: UILabel!
    @IBOutlet weak var resultPerTransportation: UILabel!
    @IBOutlet weak var distanceTxtField: InsetTextField!
    @IBOutlet weak var priceTxtField: InsetTextField!
    
    var calcutate = CalcModel(distance: 0.0, price: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func calculateResultpPerKm(){
        calcutate.distance = ((distanceTxtField.text)! as NSString).doubleValue
        calcutate.price = ((priceTxtField.text)! as NSString).doubleValue
        calcutate.calculateResultPerKm()
    }
    
    func calculateResultPerTransportation(){
        calcutate.distance = ((distanceTxtField.text)! as NSString).doubleValue
        calcutate.price = ((priceTxtField.text)! as NSString).doubleValue
        calcutate.calculateResultPerTransportation()
    }
    
    func updateUI(){
        switch CurrencySegmentControl.selectedSegmentIndex {
        case 0:
            resultPerKMLbl.text = String(format: "$%0.2f", calcutate.resultPerKM)
            resultPerTransportation.text = String(format: "$%0.2f", calcutate.resultPerTransportation);
        case 1:
            resultPerKMLbl.text = String(format: "€%0.2f", calcutate.resultPerKM)
            resultPerTransportation.text = String(format: "€%0.2f", calcutate.resultPerTransportation);
        case 2:
            resultPerKMLbl.text = String(format: "₿%0.2f", calcutate.resultPerKM)
            resultPerTransportation.text = String(format: "₿%0.2f", calcutate.resultPerTransportation);
        case 3:
            resultPerKMLbl.text = String(format: "ETH%0.2f", calcutate.resultPerKM)
            resultPerTransportation.text = String(format: "ETH%0.2f", calcutate.resultPerTransportation);
        case 4:
            resultPerKMLbl.text = String(format: "XRP%0.2f", calcutate.resultPerKM)
            resultPerTransportation.text = String(format: "XRP%0.2f", calcutate.resultPerTransportation);
        default:
            break
        }
    }
    
    
    @IBAction func segmentControlWasPressed(_ sender: Any) {
        updateUI()
    }
    
    @IBAction func calculateBtnWasPressed(_ sender: Any) {
        calculateResultpPerKm()
        calculateResultPerTransportation()
        updateUI()
    }
}

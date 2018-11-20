//
//  CalcModel.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 11/14/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation

class CalcModel {
    private var _distance: Double = 0
    private var _price: Double = 0
    private var _resultPerKM: Double = 0
    private var _resultPerTransportation: Double = 0
    



    var distance: Double {
        get  {
            return _distance
        }
        set {
            _distance = newValue
        }
    }
    
    var price: Double {
        get {
            return _price
        }
        set {
            _price = newValue
        }
    }
    
    var resultPerKM: Double {
      return _resultPerKM
    }
    
    var resultPerTransportation: Double {
        return _resultPerTransportation
    }
    
    init(distance: Double, price: Double) {
        self._distance = distance
        self._price = price
    }
    
    func calculateResultPerKm(){
        _resultPerKM = price / distance
    }

    func calculateResultPerTransportation(){
        _resultPerTransportation = price * distance
    }
    
}

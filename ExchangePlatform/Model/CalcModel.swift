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
    
    var resultPerKM: Double {
      return _resultPerKM
    }
    
    var resultPerTransportation: Double {
        return _resultPerTransportation
    }
    
    init(distance: Double) {
        self._distance = distance
    }
    
    func calculateResultPerKm(){
        _resultPerKM = distance / 100
    }

    func calculateResultPerTransportation(){
        _resultPerTransportation = distance * 1
    }
    
}

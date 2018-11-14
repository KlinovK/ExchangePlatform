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
    private var _result: Double = 0


    var distance: Double {
        get  {
            return _distance
        }
        set {
            _distance = newValue
        }
    }
    
    var result: Double {
      return _result
    }
    
    init(distance: Double) {
        self._distance = distance
    }
    
    func calculateResult(){
        _result = distance * 1.3
    }

}

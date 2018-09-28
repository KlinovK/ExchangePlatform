//
//  Tender.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation

class Tender {
    
    private var _tenderNumber: String
    private var _tenderPrice: String
    private var _description: String
    private var _typeOfCargo: String
    private var _key: String
    private var _fromAddress: String
    private var _toAddress: String
    
    
    var tenderNumber: String {
        return _tenderNumber
    }
    
    var description: String {
        return _description
    }
    
    var key: String {
        return _key
    }
    
    var fromAddress: String {
        return _fromAddress
    }
    
    var toAddress: String {
        return _toAddress
    }
    
    var tenderPrice: String {
        return _tenderPrice
    }
    
    var typeOfCargo: String {
        return _typeOfCargo
    }
    
    init(number: String, description: String, tenderPrice: String, typeOfCargo: String, key: String, fromAddress: String, toAddress: String) {
        self._tenderNumber = number
        self._description = description
        self._key = key
        self._fromAddress = fromAddress
        self._toAddress = toAddress
        self._tenderPrice = tenderPrice
        self._typeOfCargo = typeOfCargo
    }
    
}

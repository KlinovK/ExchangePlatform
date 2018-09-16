//
//  Order.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/15/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation

class Order {
    
    private var _orderNumber: String
    private var _description: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    private var _fromAddress: String
    private var _toAddress: String


    var orderTitle: String {
        return _orderNumber
    }
    
    var description: String {
        return _description
    }
    
    var key: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }
    
    var fromAddress: String {
        return _fromAddress
    }
    
    var toAddress: String {
        return _toAddress
    }
    

    init(number: String, description: String, key: String, members: [String], memberCount: Int, fromAddress: String, toAddress: String) {
        self._orderNumber = number
        self._description = description
        self._key = key
        self._memberCount = memberCount
        self._members = members
        self._fromAddress = fromAddress
        self._toAddress = toAddress
    }
    
}

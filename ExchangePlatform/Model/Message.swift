//
//  Message.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/4/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation

class Message {

    private var _content: String
    private var _senderID: String

    var content: String {
        return _content
    }

    var senderID: String {
        return _senderID
    }

    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }

}




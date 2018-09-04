//
//  DataService.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/27/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()


class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_COMPANY_USERS = DB_BASE.child("company_users")
    private var _REF_ORDERS = DB_BASE.child("orders")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_COMPANY_USERS: DatabaseReference {
        return _REF_COMPANY_USERS
    }
    
    var REF_ORDERS: DatabaseReference {
        return _REF_ORDERS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func createDBCompanyUser(uid: String, userData: Dictionary<String, Any>){
        REF_COMPANY_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComlete: @escaping(_ status: Bool) -> ()) {
        if groupKey != nil {
            //send to groups ref
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "sendeID": uid])
            sendComlete(true)
        }
    }
    
}










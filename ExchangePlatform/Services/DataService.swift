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
    
    //Access to FIR DB
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_ORDERS = DB_BASE.child("orders")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_ORDERS: DatabaseReference {
        return _REF_ORDERS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    // Convers uid to email
    
    func getUserName(forUID uid: String, handler: @escaping (_ userName: String) -> ()){
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    //Upload post to Feed
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComlete: @escaping(_ status: Bool) -> ()) {
        if groupKey != nil {
            //send to groups ref
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderID": uid])
            sendComlete(true)
        }
    }
    
    // Get all messages from feed 
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()){
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return}
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderID = message.childSnapshot(forPath: "senderID").value as! String
                let message = Message(content: content, senderID: senderID)
                messageArray.append(message)
            }
            handler(messageArray)
        }
    }
    
}










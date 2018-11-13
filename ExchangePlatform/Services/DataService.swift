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
    private var _REF_TENDERS = DB_BASE.child("tenders")
    
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
    
    var REF_TENDERS: DatabaseReference {
        return _REF_TENDERS
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
    
//    func getEmailFor(order: Order, handler: @escaping(_ emails: [String]) -> () ) {
//        var emailArray = [String]()
//        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
//            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else {return}
//            for user in userSnapshot {
//                if order.members.contains(user.key) {
//                    let email = user.childSnapshot(forPath: "email").value as! String
//                    emailArray.append(email)
//                }
//            }
//            handler(emailArray)
//        }
//    }
    
    //Upload post to Feed
    
    func uploadPost(withMessage message: String, forUID uid: String, withOrderKey orderKey: String?, sendComlete: @escaping(_ status: Bool) -> ()) {
        if orderKey != nil {
            REF_ORDERS.child(orderKey!).child("messages").childByAutoId().updateChildValues(["content": message, "senderID": uid])
            sendComlete(true)
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderID": uid])
            sendComlete(true)
        }
    }
    
    func uploadPostForTender(withMessage message: String, forUID uid: String, withTenderKey tenderKey: String?, sendComlete: @escaping(_ status: Bool) -> ()) {
        if tenderKey != nil {
            REF_TENDERS.child(tenderKey!).child("messages").childByAutoId().updateChildValues(["content": message, "senderID": uid])
            sendComlete(true)
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
    
    func getAllMessagesFor(desiredOrder: Order, handler: @escaping(_ messagesArray: [Message]) -> ()){
        var orderMessageArray = [Message]()
        REF_ORDERS.child(desiredOrder.key).child("messages").observeSingleEvent(of: .value) { (orderMessageSnapshot) in
            guard let orderMessageSnapshot = orderMessageSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for orderMessage in orderMessageSnapshot {
                let content = orderMessage.childSnapshot(forPath: "content").value as! String
                let senderID = orderMessage.childSnapshot(forPath: "senderID").value as! String
                let message = Message(content: content, senderID: senderID)
                orderMessageArray.append(message)
            }
            handler(orderMessageArray)
        }
    }
    
    func getEmail(forSearchQuery query: String, handler: @escaping (_ emailArray: [String]) -> ()){
        var emailArray = [String]()
        REF_USERS.observe(.value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if email.contains(query) == true && email != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    func getIDs(forUsernames usernames: [String], handler: @escaping (_ uidArray: [String] ) -> ()){
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
          var idArray = [String]()
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if usernames.contains(email) {
                    idArray.append(user.key)
                }
            }
            handler(idArray)
        }
    }
    func createOrder(withNumber number: String, andDescription description: String, orderPrice price: String, typeOfCargo type: String, forUserIDs ids: [String], fromAddress: String, toAddress: String, handler: @escaping(_ orderCreated: Bool) -> ()){
        REF_ORDERS.childByAutoId().updateChildValues(["number": number, "description": description, "orderPrice": price, "typeOfCargo": type,"ids": ids, "fromAddress": fromAddress, "toAddress": toAddress])
        handler(true)
    }
    
    func getAllOrders(handler: @escaping(_ ordersArray: [Order]) -> ()){
        var ordersArray = [Order]()
        REF_ORDERS.observeSingleEvent(of: .value) { (orderSnapshot) in
            guard let orderSnapshot = orderSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for order in orderSnapshot {
                let memberArray = order.childSnapshot(forPath: "ids").value as! [String]
                if memberArray.contains((Auth.auth().currentUser?.uid)!) {
                    let number = order.childSnapshot(forPath: "number").value as! String
                    let description = order.childSnapshot(forPath: "description").value as! String
                    let fromAddress = order.childSnapshot(forPath: "fromAddress").value as! String
                    let toAddress = order.childSnapshot(forPath: "toAddress").value as! String
                    let orderPrice = order.childSnapshot(forPath: "orderPrice").value as! String
                    let typeOfCargo = order.childSnapshot(forPath: "typeOfCargo").value as! String
                    let order = Order(number: number, description: description, orderPrice: orderPrice, typeOfCargo: typeOfCargo, key: order.key, fromAddress: fromAddress, toAddress: toAddress )
                    ordersArray.append(order)
                }
                
            }
            handler(ordersArray)
        }
    }
    
    func createTender(withNumber number: String, andDescription description: String, tenderPrice price: String, typeOfCargo type: String, fromAddress: String, toAddress: String, handler: @escaping(_ tenderCreated: Bool) -> ()){
        REF_TENDERS.childByAutoId().updateChildValues(["number": number, "description": description, "tenderPrice": price, "typeOfCargo": type, "fromAddress": fromAddress, "toAddress": toAddress])
        handler(true)
    }
    
    func getAllTenders(handler: @escaping(_ tendersArray: [Tender]) -> ()){
        var tendersArray = [Tender]()
        REF_TENDERS.observeSingleEvent(of: .value) { (tenderSnapshot) in
            guard let tenderSnapshot = tenderSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for tender in tenderSnapshot {
                    let number = tender.childSnapshot(forPath: "number").value as! String
                    let description = tender.childSnapshot(forPath: "description").value as! String
                    let fromAddress = tender.childSnapshot(forPath: "fromAddress").value as! String
                    let toAddress = tender.childSnapshot(forPath: "toAddress").value as! String
                    let tenderPrice = tender.childSnapshot(forPath: "tenderPrice").value as! String
                    let typeOfCargo = tender.childSnapshot(forPath: "typeOfCargo").value as! String
                    let tender = Tender(number: number, description: description, tenderPrice: tenderPrice, typeOfCargo: typeOfCargo, key: tender.key, fromAddress: fromAddress, toAddress: toAddress )
                    tendersArray.append(tender)
            }
            handler(tendersArray)
        }
    }
    
    func getAllMessagesFor(desiredTender: Tender, handler: @escaping(_ messagesArray: [Message]) -> ()){
        var tenderMessageArray = [Message]()
        REF_TENDERS.child(desiredTender.key).child("messages").observeSingleEvent(of: .value) { (tenderMessageSnapshot) in
            guard let tenderMessageSnapshot = tenderMessageSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for tenderMessage in tenderMessageSnapshot {
                let content = tenderMessage.childSnapshot(forPath: "content").value as! String
                let senderID = tenderMessage.childSnapshot(forPath: "senderID").value as! String
                let message = Message(content: content, senderID: senderID)
                tenderMessageArray.append(message)
            }
            handler(tenderMessageArray)
        }
    }
    
    
}










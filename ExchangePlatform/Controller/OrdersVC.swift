//
//  SecondViewController.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/27/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class OrdersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ordersArray = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_ORDERS.observe(.value) { (snapshot) in
            DataService.instance.getAllOrders { (returnedOrdersArray) in
                self.ordersArray = returnedOrdersArray
                self.tableView.reloadData()
            }
        }
      
    }

}


extension OrdersVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as? OrderCell  else {return UITableViewCell()}
        let order = ordersArray[indexPath.row]
        cell.configureCell(number: order.ordernNumber, orderPrice: order.orderPrice, typeOfCargo: order.typeOfCargo, description: order.description , memberCount: order.memberCount, addressFrom: order.fromAddress, addressTo:  order.toAddress)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let orderFeedVC = storyboard?.instantiateViewController(withIdentifier: "OrderFeedVC") as? OrderProfileAndFeedVC else {return}
        orderFeedVC.initData(forOrder: ordersArray[indexPath.row])
        presentDetail(orderFeedVC)
    }
}


//
//  TendersVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 10/1/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class TendersVC: UIViewController {

    @IBOutlet weak var tableOfTenders: UITableView!
    
    var tendersArray = [Tender]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableOfTenders.delegate = self
        tableOfTenders.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_TENDERS.observe(.value) { (snapshot) in
            DataService.instance.getAllTenders { (returnedTendersArray) in
                self.tendersArray = returnedTendersArray
                self.tableOfTenders.reloadData()
            }
        }
        
    }
    
}


extension TendersVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tendersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tenderCell", for: indexPath) as? TenderCell  else {return UITableViewCell()}
        let tender = tendersArray[indexPath.row]
        cell.configureCell(number: tender.tenderNumber, tenderPrice: tender.tenderPrice, typeOfCargo: tender.typeOfCargo, description: tender.description , addressFrom: tender.fromAddress, addressTo:  tender.toAddress)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tenderProfileVC = storyboard?.instantiateViewController(withIdentifier: "TenderProfileVC") as? TenderProfileVC else {return}
        tenderProfileVC.initData(forTender: tendersArray[indexPath.row])
        presentDetail(tenderProfileVC)
    }
}


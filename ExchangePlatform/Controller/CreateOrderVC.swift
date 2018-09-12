//
//  CreateOrderVC.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 9/12/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class CreateOrderVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailSearchTxtField: InsetTextField!
    @IBOutlet weak var numberTxtField: InsetTextField!
    @IBOutlet weak var descriptionTxtField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var orderMemeberLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }


    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
    }
    

}

extension CreateOrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else {return UITableViewCell()}
       let profileImage = UIImage(named: "user")
        cell.configureCell(profileImage: profileImage!, email: "random@gmail.com", isSelected: true)
        return cell
    }
    
}

//
//  MenuController.swift
//  FundooApp
//
//  Created by admin on 31/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class MenuController : UIViewController{
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        
    }
    
    func confugureTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension MenuController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}

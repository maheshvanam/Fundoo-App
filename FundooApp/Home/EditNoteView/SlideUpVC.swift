//
//  SlideUpVC.swift
//  FundooApp
//
//  Created by admin on 09/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SlideUpVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      }
}

extension SlideUpVC: UITableViewDelegate,
UITableViewDataSource {
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 6
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           if(indexPath.row == 5){
              let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTabelCell", for: indexPath) as! CollectionViewTabelCell
              return cell
           }
           else{
               let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsCell", for: indexPath) as! OptionsCell
               return cell
           }
       }
        
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print(indexPath.row)
       }
}

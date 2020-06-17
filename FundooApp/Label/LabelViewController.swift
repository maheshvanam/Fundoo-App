//
//  LabelViewController.swift
//  FundooApp
//
//  Created by admin on 17/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let ReusableCellId = "CheckMarkCell"
let checkMarkNib = "CheckMarkCell"
let rowHeight:CGFloat = 50

class LabelViewController: UIViewController {
    
    @IBOutlet var labelTableView:UITableView!
    var dataSource:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: checkMarkNib, bundle: nil)
        labelTableView.register(nib, forCellReuseIdentifier: ReusableCellId)
        labelTableView.delegate = self
        labelTableView.dataSource = self
        dataSource.append("1")
        dataSource.append("2")
        dataSource.append("3")
    }

}
extension LabelViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = labelTableView.dequeueReusableCell(withIdentifier: ReusableCellId, for: indexPath) as! CheckMarkCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}

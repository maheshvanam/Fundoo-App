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

extension SlideUpVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 5){
            let cell = tableView.dequeueReusableCell(withIdentifier:Constants.CollectionView_TabelCell_ID, for: indexPath) as! CollectionViewTabelCell
            return cell
        }
        let menuOption = SlideUpMenuOption(rawValue: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.OPTIONS_CELL_ID, for: indexPath) as! OptionsCell
        
        cell.optionImage.image = menuOption?.image
        cell.optionLabel.text = menuOption?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectOption(indexPath: indexPath)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.CLOSE_SLIDE_UP_MENU), object: nil)
    }
    
    func didSelectOption(indexPath: IndexPath){
        let option = SlideUpMenuOption(rawValue: indexPath.row)
        switch option! {
        case .Delete:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.DELETE_NOTE_KEY), object: nil)
        case .MakeACopy:
            print("Other")
        case .Send:
            print("Other")
        case .Collaborator:
            print("Other")
        case .Labels:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.ADD_LABEL_KEY), object: nil)
        }
    }
}

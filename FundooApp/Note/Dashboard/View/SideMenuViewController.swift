//
//  SideMenuViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let numberOfRowsInSideMenu  = 6
let sideMenuCellNib         = "SideMenuCell"
let sideMenuCellReusabaleId = "SideMenuCell"
let sideMenuLabelCellNib    = "SideMenuLabelCell"
let sideMenuLabelCellId     = "SideMenuLabelCell"
let unExpectedOption        = "invalid option"
let firstSection            = 0
let secondSection           = 1
let thirdSection            = 2
let fourthSection           = 3
let sectionsCount           = 3
let notesOption             = 0
let reminderOption          = 1

let labelsOption            = 0

let createLabelOption       = 0
let archiveOption           = 1
let trashOption             = 2
let signOutOption           = 3


class SideMenuViewController: UITableViewController, LabelViewDelegate {

    var data:[LabelResponse] = []
    var menuOption:SideMenuDelegate!
    var labelPresenter: LabelPresenterDelegate!
    var sideMenuPresenter:SideMenuPresenterDelegate!
    
    override func viewDidLoad() {
        tableView.backgroundColor = #colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
        tableView.sectionIndexTrackingBackgroundColor = #colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
        self.sideMenuPresenter = SideMenuPresenter()
        self.labelPresenter = LabelPresenter(delegate: self)
        let nib = UINib(nibName: sideMenuCellNib, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: sideMenuCellReusabaleId)
        let labelNib = UINib(nibName: sideMenuLabelCellNib, bundle: nil)
        tableView.register(labelNib, forCellReuseIdentifier: sideMenuLabelCellId)
        loadDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDataSource()
        tableView.reloadData()
        let indexPath = IndexPath.init(row: 0, section: 0)
               tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
         //handleFirstSection(option: notesOption)
    }
    
    func loadDataSource() {
        self.sideMenuPresenter.getLabels() {
            [weak self]labels in
            DispatchQueue.main.async {
                self?.data = labels
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case firstSection:
            return FirstSectionOption.allCases.count
        case secondSection:
            return data.count
        case thirdSection:
            return ThirdSectionOption.allCases.count
        default:
            fatalError(unExpectedOption)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case firstSection:
            menuOption = FirstSectionOption(rawValue: indexPath.row)
        case secondSection:
            menuOption = nil
        case thirdSection:
            menuOption = ThirdSectionOption(rawValue: indexPath.row)
        default:
            fatalError(unExpectedOption)
        }
        if indexPath.section != secondSection {
            let cell = tableView.dequeueReusableCell(withIdentifier:sideMenuCellReusabaleId, for: indexPath) as! SideMenuCell
            cell.backgroundColor =  #colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
            cell.menuImage.image = menuOption?.image
            cell.titleLabel.text = menuOption?.description
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier:sideMenuLabelCellId, for: indexPath) as! SideMenuLabelCell
        cell.backgroundColor =  #colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
        cell.titleLabel.text = data[indexPath.row].label
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == secondSection && data.count != 0 {
            label.text = Constants.labelsHeaderTitle
            label.sizeToFit()
            return label
        }
        label.isHidden = true
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == secondSection ? 15 : 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postNotification(key: Constants.TOGGLE_MENU)
        switch indexPath.section {
        case firstSection:
            handleFirstSection(option: indexPath.row)
        case secondSection:
            handleSecondSection(option: indexPath.row)
        case thirdSection:
            handleThirdSection(option: indexPath.row)
        default:
            fatalError(unExpectedOption)
        }
    }
    
    func postNotification(key: String) {
        NotificationCenter.default.post(name: Notification.Name(key), object: nil)
    }
    
    func handleFirstSection(option:Int) {
        switch option {
            
        case notesOption:
                postNotification(key: Constants.NAVIGATE_TO_NOTE)
        case reminderOption:
            postNotification(key: Constants.NAVIGATE_TO_REMINDER)
        default:
            fatalError(unExpectedOption)
        }
    }
    
    func handleSecondSection(option:Int) {
        let label = data[option]
        NotificationCenter.default.post(name: Notification.Name(Constants.LABELS), object: label)
    }
    
    func handleThirdSection(option:Int) {
        switch option {
        case labelsOption:
            postNotification(key:Constants.NAVIGATE_TO_LABELS)
        case signOutOption:
            sideMenuPresenter.signOutUser()
            self.navigationController?.popToRootViewController(animated: false)
        case trashOption:
            postNotification(key:Constants.NAVIGATE_TO_TRASH)
        case archiveOption:
            postNotification(key:Constants.NAVIGATE_TO_ARCHIVE)
        default:
            fatalError(unExpectedOption)
        }
    }
    
    func updateLabelsDataSource(label: [LabelResponse]) {
           self.data = label
       }
}

//
//  AddLabelViewController.swift
//  FundooApp
//
//  Created by admin on 23/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class UpdateLabelViewController: UIViewController, AddLabelViewDelegate {
    @IBOutlet weak var labelTitleField: UITextField!

    var addLabelPresenter: AddLabelPresenterDelegate!
    var label:LabelResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextField()
        addLabelPresenter = AddLabelPresenter(delegate: self)
    }
    
    func updateTextField(){
        if let label = self.label {
            labelTitleField.text = label.label
        }
    }
    
    @IBAction func onSaveButtonTapped(sender: UIButton) {
        if let title = labelTitleField.text {
            if label == nil {
                let uId = UserDefaults.standard.string(forKey: RestConstants.uId)
                label = LabelResponse(label: title, isDeleted: false, userId: uId!)
                self.addLabelPresenter.createLabel(label:label!)
            }
            else {
                label?.label = title
                self.addLabelPresenter.updateLabel(label:label!)
            }
           // self.addLabelPresenter.save()
            labelTitleField.text = ""
        }
        navigationController?.popViewController(animated: true)
    }
}

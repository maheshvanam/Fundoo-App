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
    var label:Label?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextField()
        addLabelPresenter = AddLabelPresenter(delegate: self)
    }
    
    func updateTextField(){
        if let label = self.label {
            labelTitleField.text = label.title
        }
    }
    
    @IBAction func onSaveButtonTapped(sender: UIButton) {
        if let title = labelTitleField.text {
            if label == nil {
                self.label = self.addLabelPresenter.createLabel()
            }
            self.label!.title = title
            self.addLabelPresenter.save()
            labelTitleField.text = ""
        }
    }
}

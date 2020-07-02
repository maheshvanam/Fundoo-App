//
//  ProfilePresenterImpl.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Firebase
class ProfilePresenterImpl: ProfileDelegate {
    
    var profileView : ProfilePresenterDelegate
    
    init(delegate: ProfilePresenterDelegate) {
           self.profileView = delegate
    }
    
    func fetchUserData() {
        let user = Auth.auth().currentUser
        let db = Firestore.firestore()
       let dbRef =  db.collection("users").document(user!.uid)
        dbRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                let name = " \(dataDescription!["firstName"] as! String) \(dataDescription!["lastName"] as! String)"
                self.profileView.updateLabel(name: name, email:(user?.email)! )
            } else {
                print("Document does not exist")
            }
        }
    }

}

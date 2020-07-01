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

//    func fetchUserData() {
//        let data = DatabaseManager()
//        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
//        do {
//      //--      let user = data.getCurrentUser()
//                //try data.getUser(email: email!)
//      //      self.profileView.updateLabel(user: user)
//        }
//        catch CoreDataError.UserNotFound {
//            fatalError(Constants.USER_NOT_FOUND)
//        }
//        catch{
//            fatalError(Constants.FETCH_ERROR)
//        }
//    }
}

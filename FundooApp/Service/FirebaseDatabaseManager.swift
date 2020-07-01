//
//  FirebaseDatabaseManager.swift
//  FundooApp
//
//  Created by admin on 30/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class FirebaseDatabaseManager:DataService {
    
    private let auth = Auth.auth()
    
    func insertUser(registartionUser: UserModel) {
        auth.createUser(withEmail: registartionUser.email!, password: registartionUser.password!, completion: {
            (result,error) in
            if let error = error {
                print(error)
            }
            else {
                let db = Firestore.firestore()
                let dbRef = db.collection("users").document((result?.user.uid)!)
                dbRef.setData(["firstName":registartionUser.firstName!
                    ,"lastName":registartionUser.lastName!,"email":registartionUser.email!,"id":result!.user.uid])
            }
        })
    }
    
    func isLoggedIn()->Bool {
        return auth.currentUser != nil ? true : false
    }
    
    func signOutUser(){
        do{
            try auth.signOut()
        }catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func signInwithEmailAndPassword(email: String,password: String)
    {
        auth.signIn(withEmail: email, password: password)
    }
    
    func insertNote(note:NoteDataModel) {
  
    }
}

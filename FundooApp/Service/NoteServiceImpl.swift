//
//  NoteServiceImpl.swift
//  FundooApp
//
//  Created by admin on 01/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class NoteServiceImpl:NoteService {
    func insertUserNote(note: NoteDataModel) {
        let database = Firestore.firestore()
        let userRef = database.collection("users").document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection("notes").document()
        note.setNoteId(id:noteRef.documentID)
        noteRef.setData(note.toDictionary())
    }
    
    func insertUserNote(note: NoteModel) {
        let database = Firestore.firestore()
        let userRef = database.collection("users").document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection("notes").document()
        note.setId(id: noteRef.documentID)
        do {
            try noteRef.setData(from: note)
        }
        catch {
                fatalError("error")
            }
        
    }
}

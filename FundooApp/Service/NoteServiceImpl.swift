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
    
    var notes:[NoteModel] = []

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
    
    func getAllNotes() -> [NoteModel] {
        self.notes = []
        let database = Firestore.firestore()
        let userRef = database.collection("users").document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection("notes")
        noteRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let note = try document.data(as: NoteModel.self)! as NoteModel
                        self.notes.append(note)
                    }
                    catch {
                        fatalError("Error while getting Notes")
                    }
                }
                print(self.notes)
            }
        }
        print(self.notes.count)
        return self.notes
    }
    
    func updateModel(notes: [NoteModel]){
        self.notes = notes
    }
    
}

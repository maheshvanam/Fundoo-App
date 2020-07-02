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

private let userCollectionName = "users"
private let notesCollectionName = "notes"

class NoteServiceImpl:NoteService {
    
    var notes:[NoteModel] = []

    func insertUserNote(note: NoteModel) {
        let database = Firestore.firestore()
        let userRef = database.collection(userCollectionName).document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection(notesCollectionName).document()
        note.setId(id: noteRef.documentID)
        do {
            try noteRef.setData(from: note)
        }
        catch {
            fatalError(error.localizedDescription)
            }
    }
    
    func getAllNotes() -> [NoteModel] {
        self.notes = []
        let database = Firestore.firestore()
        let userRef = database.collection(userCollectionName).document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection(notesCollectionName)
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
                        fatalError(error.localizedDescription)
                    }
                }
                print(self.notes)
            }
        }
        print(self.notes.count)
        return self.notes
    }
    
    func updateNote(note:NoteModel) {
        let database = Firestore.firestore()
        let userRef = database.collection(userCollectionName).document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection(notesCollectionName).document(note.id!)
        
        do {
            try noteRef.setData(from: note)
        }
        catch{
            fatalError(error.localizedDescription)
        }
    }
    
}

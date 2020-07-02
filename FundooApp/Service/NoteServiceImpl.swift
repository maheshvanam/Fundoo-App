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
    let database = Firestore.firestore()
    
    func insertUserNote(note: NoteModel) {
        let userRef = database.collection(userCollectionName).document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection(notesCollectionName).document()
        note.id = noteRef.documentID
        do {
            try noteRef.setData(from: note)
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getAllNotes() -> [NoteModel] {
        self.notes = []
        let userRef = database.collection(userCollectionName).document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection(notesCollectionName)
        noteRef.getDocuments { (querySnapshot, err) in
            if let error = err {
                print("Error getting documents: \(error.localizedDescription)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let note = try document.data(as: NoteModel.self)! as NoteModel
                        print(note.title as Any)
                        self.notes.append(note)
                    }
                    catch {
                        fatalError(error.localizedDescription)
                    }
                }
                print("After for .... ",self.notes.count)
            }
        }
        print("At return ",self.notes.count)
        return self.notes
    }
    
    func updateNote(note:NoteModel) {
        let userRef = database.collection(userCollectionName).document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection(notesCollectionName).document(note.id!)
        
        do {
            try noteRef.setData(from: note)
        }
        catch{
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteNote(note: NoteModel) {
        let userRef = database.collection(userCollectionName).document(Auth.auth().currentUser!.uid)
        let noteRef = userRef.collection(notesCollectionName).document(note.id!)
        noteRef.delete()
    }
}

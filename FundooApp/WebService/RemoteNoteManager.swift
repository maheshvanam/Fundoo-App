//
//  RestNoteDBManager.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

class RemoteNoteManager: RemoteNoteService {
    
    public static let shared = RemoteNoteManager()
    private var notes:[NoteResponse] = []
    var header = HTTPHeaders()
    let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
    private let UNAUTHORIZED_ERROR_CODE = 401
    
    private init(){ }
    
    func getAllNotes(urlPath:String,callback: @escaping([NoteResponse])-> Void)  {
        let request = AF.request(urlPath, method: .get, parameters:[RestConstants.accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
        request.responseDecodable(of: ResultData.self) { [weak self] response in
            if let error = response.value?.error {
                if error.statusCode == self?.UNAUTHORIZED_ERROR_CODE {
                    self?.autoSignInUser()
                }
            }
            guard let data = response.value?.data else {
                if let err = response.error {
                    if urlPath == RestUrl.GET_ALL_NOTES_PATH {
                        callback((self?.getOfflineNotes())!)
                    }
                    print(err.localizedDescription as String)
                }
                return
            }
            let notes =  data.data
            callback(notes!)
        }
       
    }
    
    func getLabelNotes(urlPath:String,callback: @escaping([NoteResponse])-> Void)  {
        let request = AF.request(urlPath, method: .post, parameters:[RestConstants.accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
        request.responseDecodable(of: ResultData.self) { response in
            guard let data = response.value?.data else {
                if let err = response.error {
                    print(err.localizedDescription as String)
                }
                return
            }
            let notes =  data.data
            callback(notes!)
        }
    }

    func insertUserNote(note: NoteResponse) {
        let params = ["title":note.title,"description":note.description,"isArchived":note.isArchived    ,"color":note.color] as [String:Any]
        header.add(name: RestConstants.authKey, value: authId!)
        let request = AF.request(RestUrl.ADD_NOTE_URL_PATH, method: .post, parameters: params,encoding: URLEncoding.default, headers: header)
        request.responseData { [weak self](data) in
            switch data.result {
            case .success(_):
                self?.insertOfflineNote(note: note)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func updateNote(note: NoteResponse) {
        let params:Parameters = ["noteId":note.id,
                                "title":note.title,
                                 "description":note.description,"color":note.color]
        self.postRequest(params: params, urlPath: RestUrl.UPDATE_NOTES_PATH)
    }
    
    func addToArchive(note: NoteResponse) {
        let params:Parameters = ["isArchived": !note.isArchived, "noteIdList": [note.id] ]
        self.postRequest(params: params, urlPath: RestUrl.ARCHIVE_NOTES_PATH)
    }
    
    func addToTrash(note: NoteResponse) {
        let params:Parameters = ["isDeleted": !note.isDeleted, "noteIdList": [note.id] ]
        self.postRequest(params: params, urlPath: RestUrl.TRASH_NOTES_URL_PATH)
    }
    
    func deleteNoteForever(note: NoteResponse){
        let params:Parameters = [ "noteIdList": [note.id] ]
        self.postRequest(params: params, urlPath: RestUrl.DELETE_NOTE_PATH)
    }
    
    func postRequest( params:Parameters, urlPath:String) {
        header.add(name: RestConstants.authKey, value: authId!)
        let request = AF.request(urlPath, method: .post, parameters: params,encoding: URLEncoding.default, headers: header)
        request.responseData { (data) in
            switch data.result {
            case .success(let result):
                let response = String.init(data: result, encoding: .utf8)
                print(response! as String)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func insertOfflineNote(note : NoteResponse){
        let localDb = CoreDataServiceImpl.shared
        let localUser = localDb.getCurrentUser()
        let localNote = localDb.createNote()
        localNote.title = note.title
        localNote.note = note.description
        localNote.color = note.color
        localNote.owner = localUser
        localDb.saveData()
    }
    
    func getOfflineNotes()-> [NoteResponse] {
        let localDb = CoreDataServiceImpl.shared
        let localUser = localDb.getCurrentUser()
        let localNotes = localUser.notes!.allObjects as! [Note]
        var notes:[NoteResponse] = []
        for note in localNotes {
            notes.append(NoteResponse(localNote:note))
        }
        return notes
    }
    
    func autoSignInUser(){
        let userService = RemoteUserManager()
        let keychain = KeychainWrapper.standard
        let email = keychain.string(forKey: UserInfoKey.EMAIL)
        let password = keychain.string(forKey: UserInfoKey.PASSWORD)
        userService.signInUser(user: UserResponse(email: email!, password: password!)) { (result) in
            switch(result) {
            case .success(let user):
                DispatchQueue(label: "KeychainQueue", qos: .background).async {
                    keychain.set(user.id!, forKey: UserInfoKey.ACCESS_TOKEN)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

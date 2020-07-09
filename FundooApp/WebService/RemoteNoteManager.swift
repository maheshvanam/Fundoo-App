//
//  RestNoteDBManager.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire

class RemoteNoteManager: RemoteNoteService {
    
    public static let shared = RemoteNoteManager()
    private var notes:[NoteResponse] = []
    var header = HTTPHeaders()
    
    let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
    
    private init(){ }
    
    func getAllNotes(urlPath:String,callback: @escaping([NoteResponse])-> Void)  {
        let request = AF.request(urlPath, method: .get, parameters:[RestConstants.accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
        request.responseDecodable(of: ResultData.self) { response in
            guard let data = response.value?.data else {
                let err = response.error
                print(err!.localizedDescription as String)
                return
            }
            let notes =  data.data
            callback(notes!)
        }
    }
    
    func insertUserNote(note: NoteResponse) {
        let url = RestUrl.ADD_NOTE_URL_PATH
        header.add(name: RestConstants.authKey, value: authId!)
        let param = ["title":note.title,"description":note.description,"isArchived":false,"color":note.color] as [String:Any]
        let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
        request.responseData { (data) in
            switch data.result {
            case .success(let result):
                print(result)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func updateNote(note: NoteResponse) {
        let url = RestUrl.updateNotesUrl
        header.add(name: RestConstants.authKey, value: authId!)
        let param:Parameters = ["noteId":note.id,
                                "title":note.title,
                                "description":note.description,"color":note.color]
        let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
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
    
    func addToArchive(note: NoteResponse) {
        let url = RestUrl.ARCHIVE_NOTES_PATH
        header.add(name: RestConstants.authKey, value: authId!)
        let param:Parameters = ["isArchived": !note.isArchived, "noteIdList": [note.id] ]
        let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
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
    
    func addToTrash(note: NoteResponse) {
        let url = RestUrl.TRASH_NOTES
        header.add(name: RestConstants.authKey, value: authId!)
        let param:Parameters = ["isDeleted": !note.isDeleted, "noteIdList": [note.id] ]
        let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
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
    
   func deleteNoteForever(note: NoteResponse){
        let url = RestUrl.DELETE_NOTE_PATH
        header.add(name: RestConstants.authKey, value: authId!)
        let param:Parameters = [ "noteIdList": [note.id] ]
        let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
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
}

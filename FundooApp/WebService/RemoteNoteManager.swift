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
    
    private init(){ }
    
    func getAllNotes(  callback: @escaping([NoteResponse])-> Void)  {
        let url = RestUrl.getNotesListUrl
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
        let request = AF.request(url, method: .get, parameters:[RestConstants.accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
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
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
        var header = HTTPHeaders()
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
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
        var header = HTTPHeaders()
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
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
        var header = HTTPHeaders()
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
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
        var header = HTTPHeaders()
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
    
    func getArchiveNotes(callback: @escaping([NoteResponse])-> Void) {
        let url = RestUrl.GET_ARCHIVE_NOTES_PATH
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
        let request = AF.request(url, method: .get, parameters:[RestConstants.accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
        request.responseDecodable(of: ResultData.self) { response in
            guard let data = response.value?.data else {
                if let err = response.error {
                print(err.localizedDescription as String)
                }
                print(response)
                return
            }
            let notes =  data.data
            callback(notes!)
        }
    }
    
    func getTrashNotes(callback: @escaping([NoteResponse])-> Void) {
        let url = RestUrl.GET_TRASH_NOTES_PATH
           let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
           let request = AF.request(url, method: .get, parameters:[RestConstants.accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
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
    func deleteNoteForever(note: NoteResponse){
        let url = RestUrl.DELETE_NOTE_PATH
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
        var header = HTTPHeaders()
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

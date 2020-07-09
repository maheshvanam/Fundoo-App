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
        print(note.color)
        let params = ["title":note.title,"description":note.description,"isArchived":false,"color":note.color] as [String:Any]
        self.postRequest(params: params, urlPath: RestUrl.ADD_NOTE_URL_PATH )
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
}

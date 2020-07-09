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
            let data = response.value?.data
            let notes =  data?.data
            callback(notes!)
            
        }
    }
    
    func insertUserNote(note: NoteResponse) {
        let url = RestUrl.addNotesUrl
                   let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
                   var header = HTTPHeaders()
                   header.add(name: RestConstants.authKey, value: authId!)
                   let param = ["title":note.title!,"description":note.description!]
                   let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
                   request.responseData { (data) in
                       switch data.result {
                       case .success(_):
                           print(data.result)
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
        let param:Parameters = ["noteId":note.id!,
                                "title":note.title!,
                                "description":note.description!]
        let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
        request.responseData { (data) in
            switch data.result {
            case .success(let result):
                print(result.description)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

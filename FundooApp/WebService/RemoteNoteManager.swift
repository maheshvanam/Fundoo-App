//
//  RestNoteDBManager.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire

class RemoteNoteManager {
    
    private let authKey = "Authorization"
    private let accessTokenKey = "access_token"

    func getAllNotes(  callback: @escaping([NoteResponse])-> Void)  {
        let url = RestUrl.getNotesList.rawValue
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId.rawValue)
          AF.request(url, method: .get, parameters:[accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil).response{
              (response) in
              guard let data = response.data else {return}
            do {
                let notes = try JSONSerialization.jsonObject(with: data, options: []) //JSONDecoder().decode(NoteResponse.self,from: data)
                print(notes)
            }
            catch {
                fatalError(RestConstants.jsonParsingError.rawValue)
            }
          }
       
        callback( RunTimeDB.shared.notes)
    }
    
    func insertUserNote(note:NoteResponse) {
        let url = RestUrl.addNotes.rawValue
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId.rawValue)
        var header = HTTPHeaders()
        header.add(name: authKey, value: authId!)
        do {
         let data = try JSONEncoder().encode(note)
         let param = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header).responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let result):
                        print(result)
                    case .failure(let error):
                        print(error)
                    }
            })
        }
        catch {
            fatalError(RestConstants.jsonParsingError.rawValue)
        }
        // RunTimeDB.shared.notes.append(note)
    }
    func updateNote(note:NoteResponse){
        RunTimeDB.shared.notes.append(note)
    }
}

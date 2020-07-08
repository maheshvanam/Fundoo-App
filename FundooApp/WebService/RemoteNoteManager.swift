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
    
    private let authKey = "Authorization"
    private let accessTokenKey = "access_token"
    private var notes:[NoteResponse] = []

    func getAllNotes(  callback: @escaping([NoteResponse])-> Void)  {
        let url = RestUrl.getNotesList.rawValue
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId.rawValue)
        let request = AF.request(url, method: .get, parameters:[accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
       request.responseDecodable(of: ResultData.self) { response in
        let data = response.value?.data
       let notes =  data?.data
        callback(notes!)
       }
    }
    
    func insertUserNote(note:NoteResponse) {
        let url = RestUrl.addNotes.rawValue
        let authId = UserDefaults.standard.string(forKey: RestConstants.authId.rawValue)
        var header = HTTPHeaders()
        header.add(name: authKey, value: authId!)
      //  header.add(name:"Content-Type", value: "application/j")
        do {
        // let data = try JSONEncoder().encode(note)
            //print(data," &&&&&&&&&&&&&&&&")
        // let param = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
        //    print(param!)
            let param = ["title":note.title!,"description":note.description!]
           let request = AF.request(url, method: .post, parameters: param,encoding: URLEncoding.default, headers: header)
            request.responseData { (data) in
                switch data.result {
                case .success(let result):
                    print(String.init(data: result, encoding: .utf8))
                case .failure(let err):
                    print(err.localizedDescription)
                    
                }
            }
//            .responseJSON(completionHandler: { (response) in
//                    switch response.result {
//                    case .success(let result):
//                        print(result)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//            })
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
struct ResultData:Codable {
    var data:DataResponse?
}
struct DataResponse:Codable {
    var sucess:Bool!
    var message:String!
    var data:[NoteResponse]!
}

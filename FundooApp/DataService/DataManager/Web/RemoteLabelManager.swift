//
//  RemoteLabelManager.swift
//  FundooApp
//
//  Created by admin on 10/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper
class RemoteLabelManager:RemoteLabelService {
    
    public static let shared = RemoteLabelManager()
    var header = HTTPHeaders()
    //let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
    let authId = KeychainWrapper.standard.string(forKey: UserInfoKey.ACCESS_TOKEN)
    
    private init() {
        // default private constructor
    }
    
    func createLabel(label:LabelResponse) {
        header.add(name: RestConstants.authKey, value: label.userId)
        let request = AF.request(RestUrl.CREATE_LABEL_URL_PATH, method: .post, parameters: label.toDictionary(),encoding: URLEncoding.default, headers: header)
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
    
    func getLabels(urlPath:String,callback: @escaping([LabelResponse])-> Void)  {
        let request = AF.request(urlPath, method: .get, parameters:[RestConstants.accessTokenKey:authId!] ,encoding: URLEncoding.default, headers: nil)
        request.responseDecodable(of: LabelDataResponse.self) { response in
            guard let data = response.value else {
                let err = response.error
                print(err!.localizedDescription as String)
                return
            }
            if  let labels =  data.data?.details {
            DispatchQueue.main.async{
                    callback(labels)
                }
            }
        }
    }
    
    func deleteLabel(label:LabelResponse){
        let urlPath = RestUrl.LABELS_URL_PATH+label.id+RestUrl.DELETE_LABEL_PATH
        header.add(name: RestConstants.authKey, value: label.userId)
        let request = AF.request(urlPath, method: .delete, parameters: nil,encoding: URLEncoding.default, headers: header)
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
    
    func updateLabel(label:LabelResponse){
        let urlPath = RestUrl.LABELS_URL_PATH+label.id+RestUrl.UPDATE_LABEL_PATH
        
        header.add(name: RestConstants.authKey, value: label.userId)
        let request = AF.request(urlPath, method: .post, parameters: ["label":label.label],encoding: URLEncoding.default, headers: header)
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
    
    func addLabelToNote(note:NoteResponse,label:LabelResponse){
        let urlPath = RestUrl.NOTES_URL_PATH+note.id+RestUrl.ADD_LABEL_TO_NOTE+label.id+RestUrl.ADD_PATH
        print(urlPath,"  ;;  ",label.userId )
        header.add(name: RestConstants.authKey, value: label.userId)
        let request = AF.request(urlPath, method: .post, parameters: [RestConstants.accessTokenKey:authId!],encoding: URLEncoding.default, headers: header)
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
    
    func removeLabelFromNote(note:NoteResponse,label:LabelResponse){
        let urlPath = RestUrl.NOTES_URL_PATH+note.id+RestUrl.ADD_LABEL_TO_NOTE+label.id+RestUrl.REMOVE_PATH
        header.add(name: RestConstants.authKey, value: label.userId)
        let request = AF.request(urlPath, method: .post, parameters: [RestConstants.accessTokenKey:authId!],encoding: URLEncoding.default, headers: header)
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

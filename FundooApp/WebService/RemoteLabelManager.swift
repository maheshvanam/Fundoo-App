//
//  RemoteLabelManager.swift
//  FundooApp
//
//  Created by admin on 10/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire

class RemoteLabelManager:RemoteLabelService {
    
    public static let shared = RemoteLabelManager()
    var header = HTTPHeaders()
    let authId = UserDefaults.standard.string(forKey: RestConstants.authId)
    
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
        request.response { (response) in
            if let data = response.value {
                print(String.init(data: data!, encoding: .utf8))
            }
        }
//        request.responseDecodable(of: ResultData.self) { response in
//            guard let data = response.value?.data else {
//                let err = response.error
//                print(err!.localizedDescription as String)
//                return
//            }
//            let notes =  data.data
//            callback(notes!)
//        }
    }
}

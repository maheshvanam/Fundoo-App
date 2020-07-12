//
//  UserDBManager.swift
//  FundooApp
//
//  Created by admin on 04/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class RemoteUserManager: RemoteUserService {
    
    func saveUser(user:UserResponse, completion: @escaping (Result<Int,APIError>)->Void ) {
        do {
            guard let resourceURL = URL(string: RestUrl.SIGN_UP_URL_PATH) else {return}
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = RestConstants.post
            urlRequest.addValue(RestConstants.contentTypeValue, forHTTPHeaderField: RestConstants.contentTypeKey)
            urlRequest.httpBody = try JSONEncoder().encode(user)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200  else {
                    DispatchQueue.main.async {
                        completion(.failure(.responseError))
                    }
                    return
                }
                let localDb = CoreDataServiceImpl.shared
                let localUser = UserModel(user: user)
                localDb.insertUser(registartionUser: localUser)
                DispatchQueue.main.async {
                    completion(.success(httpResponse.statusCode))
                }
            }
            dataTask.resume()
        }
        catch {
            DispatchQueue.main.async {
                completion(.failure(.encodingError))
            }
        }
    }
    
    func signInUser(user:UserResponse, completion: @escaping (Result<UserResponse,APIError>)->Void ) {
        do {
            guard let resourceURL = URL(string: RestUrl.LOGIN_URL_PATH) else {return}
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = RestConstants.post
            urlRequest.addValue(RestConstants.contentTypeValue, forHTTPHeaderField: RestConstants.contentTypeKey)
            urlRequest.httpBody = try JSONEncoder().encode(user)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200,let jsonData = data else {
                    DispatchQueue.main.async {
                        completion(.failure(.responseError))
                    }
                    return
                }
                do {
                    let userData = try JSONDecoder().decode(UserResponse.self, from: jsonData)
                    DispatchQueue.main.async {
                        completion(.success(userData))
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        completion(.failure(.decodingError))
                    }
                }
            }
            dataTask.resume()
        }
        catch {
            DispatchQueue.main.async {
                completion(.failure(.encodingError))
            }
        }
    }
    
}

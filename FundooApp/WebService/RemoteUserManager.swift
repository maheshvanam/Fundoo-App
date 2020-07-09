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
            guard let resourceURL = URL(string: RestUrl.userSignupUrl) else {return}
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = RestConstants.post
            urlRequest.addValue(RestConstants.contentTypeValue, forHTTPHeaderField: RestConstants.contentTypeKey)
            urlRequest.httpBody = try JSONEncoder().encode(user)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200  else {
                        completion(.failure(.responseError))
                    return
                }
                    completion(.success(httpResponse.statusCode))
            }
            dataTask.resume()
        }
        catch {
                completion(.failure(.encodingError))
        }
    }
    
    func signInUser(user:UserResponse, completion: @escaping (Result<UserResponse,APIError>)->Void ) {
        do {
            guard let resourceURL = URL(string: RestUrl.loginUrl) else {return}
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = RestConstants.post
            urlRequest.addValue(RestConstants.contentTypeValue, forHTTPHeaderField: RestConstants.contentTypeKey)
            urlRequest.httpBody = try JSONEncoder().encode(user)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200,let jsonData = data else {
                        completion(.failure(.responseError))
                    return
                }
                do {
                    let userData = try JSONDecoder().decode(UserResponse.self, from: jsonData)
                    completion(.success(userData))
                }
                catch {
                    completion(.failure(.decodingError))
                }
            }
            dataTask.resume()
        }
        catch {
            completion(.failure(.encodingError))
        }
    }

}

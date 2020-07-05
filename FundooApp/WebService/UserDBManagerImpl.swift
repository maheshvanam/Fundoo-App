//
//  UserDBManagerImpl.swift
//  FundooApp
//
//  Created by admin on 04/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class UserDBManagerImpl: UserDBService {
    
    
    let resourceURL:URL
    
    init(endpoint: String) {
        let resourceString = "http://fundoonotes.incubation.bridgelabz.com/api/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else
        { fatalError() }
        self.resourceURL = resourceURL
    }
    
    func saveUser(user:FundooUser, completion: @escaping (Result<Int,APIError>)->Void ) {
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(user)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200  else {
                     DispatchQueue.main.async {
                    completion(.failure(.responseProblem))
                    }
                    return
                }
                 DispatchQueue.main.async {
                completion(.success(httpResponse.statusCode))
                }
            }
            dataTask.resume()
        }
        catch {
             DispatchQueue.main.async {
            completion(.failure(.encodingProblem))
            }
        }
    }
}

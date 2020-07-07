//
//  RestNoteDBManager.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class RestNoteDBManager {
    var resourceURL:URL!
    
    func setEndpoint(endpoint: String) {
        let resourceString = "http://fundoonotes.incubation.bridgelabz.com/api/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else
        { fatalError() }
        self.resourceURL = resourceURL
    }
    
    
    func getAllNotes(  callback: @escaping([FundooNote])-> Void)  {
        callback( RunTimeDB.shared.notes)
    }
    
    func insertUserNote(note:FundooNote) {
       /* do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(note)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else {
                    return
                    }
                }
                dataTask.resume()
            }
           catch {
               fatalError()
           }*/
        
         RunTimeDB.shared.notes.append(note)
    }
    func updateNote(note:FundooNote){
        RunTimeDB.shared.notes.append(note)
    }
}

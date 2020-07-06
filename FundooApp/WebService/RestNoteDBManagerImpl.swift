//
//  RestNoteDBManagerImpl.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class RestNoteDBManagerImpl {
    
    var resourceURL:URL!
    
    func setEndpoint(endpoint: String) {
        let resourceString = "http://fundoonotes.incubation.bridgelabz.com/api/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else
        { fatalError() }
        self.resourceURL = resourceURL
    }
    
    
    func getAllNotes(  callback: @escaping([FundooNote])-> Void)  {
        callback( Database.shared.notes)
//        do {
//            var urlRequest = URLRequest(url: resourceURL)
//            urlRequest.httpMethod = "GET"
//            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200  ,let jsonData = data else {
//                    return
//                }
//                do {
//                    let notes = try JSONDecoder().decode([FundooNote.self], from: jsonData)
//                    DispatchQueue.main.async {
//                        callback(notes)
//                    }
//                }
//                catch {
//
//                }
//            }
//            dataTask.resume()
//        }
    }
    
    func insertUserNote(note:FundooNote) {
         Database.shared.notes.append(note)
    }
    func updateNote(note:FundooNote){
        Database.shared.notes.append(note)
    }
}

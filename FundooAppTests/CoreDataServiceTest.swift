//
//  CoreDataServiceTest.swift
//  FundooAppTests
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import XCTest
@testable import FundooApp

class CoreDataServiceTest: XCTestCase {
    var dataService: DatabaseManager = DatabaseManager()
    
    override func setUpWithError() throws {
         //Put setup code here. This method is called before the invocation of each test method in the class.
        let user = UserModel(firstName: "fun", lastName: "doo", email: "fundoo@gmail.com", password: "Fundoo@123", confirmPassword: "Fundoo@123")
        dataService.insertUser(registartionUser: user)
    }
    
    override func tearDown() {
        dataService.deleteUser(email: "fundoo@gmail.com")
    }
    
    func test_coreDataService_whenGivenAUnRegisteredEmail_ShouldReturn_InvalidEmail()   {
        
        let result = dataService.checkValidUserOrNot(email: "Fun", password: "Fundoo@122")
        XCTAssertEqual(Result.INVALID_EMAIL, result)
    }
    
    func testCoreDataService_whenGivenAInvalidPassword_ShouldReturn_InvalidPassword()  {
        let result =  dataService.checkValidUserOrNot(email: "fundoo@gmail.com", password: "Fundoo@122")
        XCTAssertEqual(Result.INVALID_PASSWORD, result)
    }
    
    func test_CoreDataService_whenGivenAValidDetails_ShouldReturn_Success()  {
       let result = dataService.checkValidUserOrNot(email: "fundoo@gmail.com", password: "Fundoo@123")
        XCTAssertEqual(Result.SUCCESS, result)
    }
    
    func test_getDataUsingOffcet(){
        let dbManager = DatabaseManager()
        var notes: [Note] = []
        notes.append(contentsOf: dbManager.getNotesFromDB(fetchLimit:10,fetchOffSet:0))
     //   XCTAssertEqual(notes.count, 8)
        notes.append( contentsOf: dbManager.getNotesFromDB(fetchLimit:10,fetchOffSet: 10))
      //  XCTAssertEqual(notes.count, 8)
    }
    
    func test_getUserLabels() {
        let user = dataService.getCurrentUser()
        let note = dataService.createNote()
        for label in user.labels!.allObjects as! [Label] {
            label.addToNotes(note)
            XCTAssertEqual(label.notes!.count, 1)
            label.removeFromNotes(note)
            dataService.saveData()
        }
    }
}

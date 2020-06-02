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
    var dataService: CoreDataService = CoreDataService()
    
    override func setUpWithError() throws {
         //Put setup code here. This method is called before the invocation of each test method in the class.
        let user = SignUpUser(firstName: "fun", lastName: "doo", email: "fundoo@gmail.com", password: "Fundoo@123", confirmPassword: "Fundoo@123")
        dataService.insertUser(registartionUser: user)
    }
    
    override func tearDown() {
        dataService.deleteUser(email: "fundoo@gmail.com")
    }
    
    func test_coreDataService_whenGivenAUnRegisteredEmail_ShouldReturn_InvalidEmail() throws {
        let result = try dataService.checkValidUserOrNot(email: "Fun", password: "Fundoo@122")
        XCTAssertEqual(Result.INVALID_EMAIL, result)
    }
    
    func testCoreDataService_whenGivenAInvalidPassword_ShouldReturn_InvalidPassword() throws {
        //let dataService = CoreDataService()
        
        let result = try dataService.checkValidUserOrNot(email: "fundoo@gmail.com", password: "Fundoo@122")
        XCTAssertEqual(Result.INVALID_PASSWORD, result)
    }
    
    func testCoreDataService_whenGivenAValidDetails_ShouldReturn_Success() throws {
        //let dataService = CoreDataService()
        let result = try dataService.checkValidUserOrNot(email: "fundoo@gmail.com", password: "Fundoo@123")
        XCTAssertEqual(Result.SUCCESS, result)
    }
}

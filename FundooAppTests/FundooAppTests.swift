//
//  FundooAppTests.swift
//  FundooAppTests
//
//  Created by admin on 24/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import XCTest
@testable import FundooApp

class FundooAppTests: XCTestCase {
    
    func test_coreDataService_whenGivenAUnRegisteredEmail_ShouldReturn_InvalidEmail() throws {
        let dataService = CoreDataServiceImpl()
        let result = try dataService.checkValidUserOrNot(email: "Fun", password: "Fundoo@122")
        XCTAssertEqual(Result.INVALID_EMAIL, result)
    }
    
    func testCoreDataService_whenGivenAInvalidPassword_ShouldReturn_InvalidPassword() throws {
        let dataService = CoreDataServiceImpl()
        let result = try dataService.checkValidUserOrNot(email: "fundoo@gmail.com", password: "Fundoo@122")
        XCTAssertEqual(Result.INVALID_PASSWORD, result)
    }
    
}

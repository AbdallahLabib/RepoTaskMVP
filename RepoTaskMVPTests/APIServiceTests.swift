//
//  APIServiceTests.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import XCTest
@testable import RepoTaskMVP

class APIServiceTests: XCTestCase {

    var sut: APIService!
    
    override func setUpWithError() throws {
        sut = APIService()
    }

   func testGetRepositories() {
        let expection = XCTestExpectation(description: "Repositories Downloaded") // API is asynchrouns operation so that's why we are using XCTestExpectation to be able to wait untill finishing
       var responseError: Error?
       var reponseRepositories: [Repository]?
       
       sut.getRepositories { (repositories, error) in
           
           responseError = error
           reponseRepositories = repositories
           expection.fulfill()
       }
       wait(for: [expection], timeout: 1)
       XCTAssertNil(responseError)// Make sure that error == nil
       XCTAssertNotNil(reponseRepositories) // Make sure that response != nil
       
    }
    override func tearDownWithError() throws {
        sut = nil
    }

}

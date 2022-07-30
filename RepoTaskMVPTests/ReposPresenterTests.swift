//
//  ReposPresenterTests.swift
//  RepoTaskMVPTests
//
//  Created by user225645 on 29/07/2022.
//

import XCTest
@testable import RepoTaskMVP

class ReposPresenterTests: XCTestCase {
    var sut: RepositoriesPresenter!
    
    override func setUpWithError() throws {
        sut = RepositoriesPresenter(MockView(), apiService: MockAPIService())
    }
    
    func test_fetchRepos_returnCorrectCount() {
        sut.fetchRepositories()
        
        XCTAssertEqual(sut.repositoriesCount(), 10)
    }
    
    func test_fetchRepos_returnCorrectRepo() {
        sut.fetchRepositories()
        
        XCTAssertEqual(sut.repository(at: 0).repositoryName, "Robusta")
    }
}

class MockView: RepositoryView {
    func reloadRepositoriesTableView() {
    }
}

class MockAPIService: APIServicing {
    func getRepositories(completion: @escaping ([Repository]?, Error?) -> Void) {
        let mockedResponse = [
            Repository(repositoryName: "Robusta", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: "")),
            Repository(repositoryName: "RobustaX", owner: .init(imagePath: ""))
        ]
        
        completion(mockedResponse, nil)
    }
}

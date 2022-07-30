//
//  RepositoriesPresenter.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import Foundation

class RepositoriesPresenter {
    
    //MARK: - Vars
    private var repositories: [Repository] = []
    private weak var view: RepositoryView?
    private var apiService: APIServicing!
    
    //MARK: - Pagination vars
    private var paginationRepositories: [Repository] = []
    
    //MARK: - Init
    init(_ view: RepositoryView, apiService: APIServicing) {
        self.view = view
        self.apiService = apiService
    }
    
    //MARK: - Public funcs
    func fetchRepositories() {
        apiService.getRepositories { [weak self] (repositories: [Repository]?, error) in
            guard let repositories = repositories else {
                // TODO: Errors should be handled
                print("Error:", error!.localizedDescription)
                return
            }
            self?.repositories = repositories
            
            for i in 0..<10 {
                self?.paginationRepositories.append(repositories[i])
            }
            print("ThreadM", #function, Thread.isMainThread)
            self?.view?.reloadRepositoriesTableView()
        }
    }
    
    func repositoriesCount() -> Int {
        paginationRepositories.count
    }
    
    func repository(at row: Int) -> Repository {
        paginationRepositories[row]
    }
    
    func willDisplayRepository(at row: Int) {
        if row == paginationRepositories.count - 1 {
            addNewRepositories()
        }
    }
}

//MARK: - Private funcs
extension RepositoriesPresenter {
    private func addNewRepositories() {
        if paginationRepositories.count == repositories.count {
            return
        } else if paginationRepositories.count >= repositories.count - 10 {
            for index in paginationRepositories.count..<repositories.count {
                paginationRepositories.append(repositories[index])
            }
        } else {
            for index in paginationRepositories.count..<paginationRepositories.count + 10 {
                paginationRepositories.append(repositories[index])
            }
        }
        view?.reloadRepositoriesTableView()
    }
}

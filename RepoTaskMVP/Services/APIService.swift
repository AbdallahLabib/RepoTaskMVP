//
//  APIService.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import Foundation

protocol APIServicing {
    func getRepositories(completion: @escaping(_ repositories: [Repository]?, _ error: Error?) -> Void)
}

final class APIService: APIServicing {
    static let sharedService = APIService()
    private init() {}
    
    // TODO: Use Result
    func getRepositories(completion: @escaping(_ repositories: [Repository]?, _ error: Error?) -> Void) {
        guard let url = URL(string: "https://api.github.com/repositories") else { return }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode([Repository].self, from: data)
                debugPrint(response)
                print("ThreadM", #function, Thread.isMainThread)
                DispatchQueue.main.async {
                    completion(response, nil)
                }
            } catch {
                debugPrint(error.localizedDescription)
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}

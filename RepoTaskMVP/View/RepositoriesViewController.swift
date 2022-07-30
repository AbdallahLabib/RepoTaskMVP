//
//  RepositoriesViewController.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import UIKit

protocol RepositoryView: AnyObject {
    func reloadRepositoriesTableView()
}

class RepositoriesViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var repositoriesTableView: UITableView!
    
    //MARK: - Vars
    private var presenter: RepositoriesPresenter!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RepositoriesPresenter(self, apiService: APIService.sharedService)
        configureTableView()
        presenter.fetchRepositories()
        self.title = "Repositories"
    }
    
    //MARK: - Configure TableView
    private func configureTableView() {
        repositoriesTableView.dataSource = self
        repositoriesTableView.delegate = self
        repositoriesTableView.register(UINib(nibName: RepositoryCell.identifier, bundle: nil),
                                       forCellReuseIdentifier: RepositoryCell.identifier)
    }
}

//MARK: - TableView DataSource
extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.repositoriesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repositoriesTableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier,
                                                             for: indexPath) as! RepositoryCell
        let repository = presenter.repository(at: indexPath.row)
        cell.configureCell(with: repository)
        return cell
    }
}

//MARK: - TableView Delegate
extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.willDisplayRepository(at: indexPath.row)
    }
}

//MARK: - View Protocol
extension RepositoriesViewController: RepositoryView {
    func reloadRepositoriesTableView() {
        repositoriesTableView.reloadData()
    }
}

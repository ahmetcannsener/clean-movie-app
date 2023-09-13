//
//  MovieDetailViewController.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var navigationTitle: String?
    var movieID: Int?
    
    let tableView = UITableView()
    
    var viewModel: MovieDetailViewModel = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = navigationTitle ?? "Empty"
        setupUI()
        setupTableView()
        loadMovieDetail(id: String(movieID ?? 0))
        viewModelBindings()
    }
    
    func loadMovieDetail(id: String) {
        //viewModel.loadMovieDetail(id: id)
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomHeaderCell.self, forCellReuseIdentifier: "HeaderCell")
        tableView.register(CustomDetailCell.self, forCellReuseIdentifier: "DetailCell")
    }
    
    private func viewModelBindings() {
        viewModel.reloadTableViewClosure = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? CustomHeaderCell
            cell?.viewModel = CustomHeaderCellViewModel(iconURL: viewModel.movieDetail?.posterPath ?? "")
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? CustomDetailCell
            cell?.viewModel = CustomDetailCellViewModel(title: viewModel.movieDetail?.title ?? "",
                                                        releaseDate: viewModel.movieDetail?.releaseDate ?? "",
                                                        overView: viewModel.movieDetail?.overview ?? "",
                                                        voteAverage: viewModel.movieDetail?.voteAverage ?? 0.0,
                                                        voteCount: viewModel.movieDetail?.voteCount ?? 0.0,
                                                        popularity: viewModel.movieDetail?.popularity ?? 0.0)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else {
            return 300
        }
    }
}

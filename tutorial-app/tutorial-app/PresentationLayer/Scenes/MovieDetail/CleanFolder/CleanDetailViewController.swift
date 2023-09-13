//
//  CleanDetailViewController.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 4.09.2023.
//
//
import UIKit
//
// Define a protocol `CleanDisplayLogic` for the view controller to conform to.
protocol CleanDetailDisplayLogic: AnyObject {
    func fetchedMovieDetail(response: CleanDetailViewModel.MovieDetailViewModel)
}

// Create a view controller class `CleanDetailViewController` that conforms to `CleanDetailDisplayLogic`.
final class CleanDetailViewController: UIViewController, CleanDetailDisplayLogic {

    // Create a UITableView to display movie data.
    var navigationTitle: String?
    var movieID: String?

    let tableView = UITableView()

    // Create a reference to the interactor responsible for business logic.
    var interactor: DetailBusinessLogic?
    var router: (DetailRoutingLogic & DetailDataPassing)?

    // Create an array to store movie view models.
    var movieDetailDataModel = CleanDetailViewModel.MovieDetailViewModel(title: "",
                                                                         backdropPath: "",
                                                                         releaseDate: "",
                                                                         overview: "",
                                                                         voteAverage: 0.0,
                                                                         voteCount: 0.0,
                                                                         popularity: 0.0
    )

    // Initializer for the view controller.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    // Required initializer when using Storyboards (not used in this code).
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }

    // Setup function to initialize the VIP components.
    private func setup()
    {
        let viewController = self
        let interactor = CleanDetailInteractor()
        let presenter = CleanDetailPresenter()
        let router = CleanDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // Called when the view is loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the UI, table view, and fetch movies.
        title = navigationTitle ?? "Empty"
        prepareUI()
        initTableView()
        fetchMovieDetail()
        // tableView.delaysContentTouches = false
    }


    private func fetchMovieDetail() {
        let request = CleanDetailViewModel.MovieDetailRequest(movieID: movieID)
        interactor?.fetchMovieDetail(request: request)
    }

    // Function to prepare the UI and add the table view to the view.
    private func prepareUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // Function to initialize the table view.
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomHeaderCell.self, forCellReuseIdentifier: "HeaderCell")
        tableView.register(CustomDetailCell.self, forCellReuseIdentifier: "DetailCell")
    }

    // Function to handle the fetched movie data.
    func fetchedMovieDetail(response: CleanDetailViewModel.MovieDetailViewModel) {
        movieDetailDataModel = response
        tableView.reloadData()
    }
}

extension CleanDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView.allowsSelection = false
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? CustomHeaderCell
            cell?.viewModel = CustomHeaderCellViewModel(iconURL: movieDetailDataModel.backdropPath )
            //cell?.delegate = self
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? CustomDetailCell
            cell?.viewModel = CustomDetailCellViewModel(title: movieDetailDataModel.title,
                                                        releaseDate: movieDetailDataModel.releaseDate,
                                                        overView: movieDetailDataModel.overview,
                                                        voteAverage: movieDetailDataModel.voteAverage,
                                                        voteCount: movieDetailDataModel.voteCount,
                                                        popularity: movieDetailDataModel.popularity)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else {
            return 400
        }
    }

}


//
//  CustomDetailCell.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import UIKit
import Kingfisher

final class CustomDetailCell: UITableViewCell {
    
    private let title: UILabel = UILabel()
    private let releaseDate: UILabel = UILabel()
    private let overView: UILabel = UILabel()
    private let owHeader: UILabel = UILabel()
    private let voteAverage: UILabel = UILabel()
    private let voteAverageHeader: UILabel = UILabel()
    private let voteCount: UILabel = UILabel()
    private let voteCountHeader: UILabel = UILabel()
    private let popularity: UILabel = UILabel()
    private let popHeader: UILabel = UILabel()
    private let starIcon: UIImageView = UIImageView()
    
    var viewModel: CustomDetailCellViewModel? {
        didSet {
            guard let data = viewModel else { return }
            configureCell(data: data)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI() {
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            title.heightAnchor.constraint(equalToConstant: 40)
        ])
        title.numberOfLines = 0
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        
        contentView.addSubview(releaseDate)
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            releaseDate.topAnchor.constraint(equalTo: title.bottomAnchor),
            releaseDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            //releaseDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            releaseDate.widthAnchor.constraint(equalToConstant: 50),
            releaseDate.heightAnchor.constraint(equalToConstant: 20)
        ])
        releaseDate.font = UIFont.systemFont(ofSize: 16)
        releaseDate.textColor = UIColor(red: 0.3843, green: 0.3961, blue: 0.4078, alpha: 1.0)
        releaseDate.numberOfLines = 1
        releaseDate.lineBreakMode = .byTruncatingTail
        
        
        contentView.addSubview(voteAverageHeader)
        voteAverageHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteAverageHeader.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 32),
            voteAverageHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            voteAverageHeader.widthAnchor.constraint(equalToConstant: 100)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        voteAverageHeader.font = UIFont.boldSystemFont(ofSize: 14)
        voteAverageHeader.textColor = .systemOrange
        voteAverageHeader.text = "RATING" // Set the header label text
        //voteAverageHeader.textAlignment = .center
        
        contentView.addSubview(popHeader)
        popHeader.translatesAutoresizingMaskIntoConstraints = false
        popHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popHeader.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 32),
            popHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            popHeader.widthAnchor.constraint(equalToConstant: 100)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        popHeader.font = UIFont.boldSystemFont(ofSize: 14)
        popHeader.textColor = .systemOrange
        popHeader.text = "POPULARITY" // Set the header label text
        //popHeader.textAlignment = .center
        
        contentView.addSubview(voteCountHeader)
        voteCountHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteCountHeader.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 32),
            voteCountHeader.leadingAnchor.constraint(equalTo: voteAverageHeader.trailingAnchor, constant: 16),
            voteCountHeader.trailingAnchor.constraint(equalTo: popHeader.leadingAnchor, constant: -16)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        voteCountHeader.font = UIFont.boldSystemFont(ofSize: 14)
        voteCountHeader.textColor = .systemOrange
        voteCountHeader.text = "VOTE COUNT" // Set the header label text
        //voteCountHeader.textAlignment = .center
        
        contentView.addSubview(starIcon)
        starIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starIcon.topAnchor.constraint(equalTo: voteAverageHeader.bottomAnchor, constant: 8),
            starIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            starIcon.widthAnchor.constraint(equalToConstant: 25),
            starIcon.heightAnchor.constraint(equalToConstant: 25)
        ])
        starIcon.image = UIImage(systemName: "star.fill") // Use your star icon image here
        starIcon.tintColor = .systemOrange // Set the star icon color
        starIcon.contentMode = .scaleAspectFit
        
        contentView.addSubview(voteAverage)
        voteAverage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteAverage.topAnchor.constraint(equalTo: voteAverageHeader.bottomAnchor, constant: 10),
            voteAverage.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 4),
            //voteAverage.trailingAnchor.constraint(equalTo: popHeader.leadingAnchor, constant: -16)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        voteAverage.font = UIFont.systemFont(ofSize: 18)
        voteAverage.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        contentView.addSubview(voteCount)
        voteCount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteCount.topAnchor.constraint(equalTo: voteAverageHeader.bottomAnchor, constant: 10),
            voteCount.leadingAnchor.constraint(equalTo: voteAverage.trailingAnchor, constant: 65),
            //voteAverage.trailingAnchor.constraint(equalTo: popHeader.leadingAnchor, constant: -16)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        voteCount.font = UIFont.systemFont(ofSize: 18)
        voteCount.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        voteCount.textAlignment = .center
        
        contentView.addSubview(popularity)
        popularity.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularity.topAnchor.constraint(equalTo: voteAverageHeader.bottomAnchor, constant: 10),
            popularity.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
            //voteAverage.trailingAnchor.constraint(equalTo: popHeader.leadingAnchor, constant: -16)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        popularity.font = UIFont.systemFont(ofSize: 18)
        popularity.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        //popularity.textAlignment = .center
        
        
        contentView.addSubview(owHeader)
        owHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            owHeader.topAnchor.constraint(equalTo: voteAverage.bottomAnchor, constant: 32),
            owHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            //voteAverage.trailingAnchor.constraint(equalTo: popHeader.leadingAnchor, constant: -16)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        owHeader.font = UIFont.boldSystemFont(ofSize: 14)
        owHeader.textColor = .systemOrange
        owHeader.text = "OVERVIEW" // Set the header label text
        
        contentView.addSubview(overView)
        overView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overView.topAnchor.constraint(equalTo: owHeader.bottomAnchor, constant: 8),
            overView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            //voteAverage.trailingAnchor.constraint(equalTo: popHeader.leadingAnchor, constant: -16)
            //voteAverageHeader.trailingAnchor.constraint(equalTo: .trailingAnchor, constant: -16),
        ])
        overView.numberOfLines = 0
        overView.font = UIFont.systemFont(ofSize: 18)
        overView.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    }
    
    
    func configureCell(data: CustomDetailCellViewModel) {
        title.text = data.title
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.5
        //releaseDate.text = data.releaseDate
        overView.text = data.overView
        popularity.text = String(Int(data.popularity))
        voteAverage.text = String(format: "%.1f", data.voteAverage) + "/10"
        voteCount.text = String(Int(data.voteCount))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let dateString = data.releaseDate
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {
            let formattedDate = dateFormatter.string(from: date)
            releaseDate.text = formattedDate
        }
    }
}

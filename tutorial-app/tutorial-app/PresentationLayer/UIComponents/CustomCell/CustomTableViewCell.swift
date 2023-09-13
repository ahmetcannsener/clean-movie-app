//
//  CustomTableViewCell.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji on 10.08.2023.
//

import UIKit
import Kingfisher

final class CustomTableViewCell: UITableViewCell {
    
    private let iconView: UIImageView = UIImageView()
    private let backdropView: UIImageView = UIImageView()
    private let shadeView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let adultLabel: UILabel = UILabel()
    private let voteAverageLabel: UILabel = UILabel()
    private let starView: UILabel = UILabel()
    private let overviewLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    
    private var ImagePath: String = "https://image.tmdb.org/t/p/w500"
    
    var viewModel: CustomCellViewModel? {
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
        
        addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 150),
            iconView.widthAnchor.constraint(equalToConstant: 100)
        ])
        iconView.layer.cornerRadius = 20
        iconView.clipsToBounds = true
        iconView.layer.masksToBounds = true
        
        addSubview(shadeView)
        shadeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadeView.topAnchor.constraint(equalTo: topAnchor),
            shadeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadeView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        shadeView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        shadeView.isUserInteractionEnabled = false
        
        sendSubviewToBack(shadeView)
        
        
        addSubview(backdropView)
        backdropView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backdropView.topAnchor.constraint(equalTo: topAnchor),
            backdropView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backdropView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backdropView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Set the backdrop image view to be behind other subviews
        sendSubviewToBack(backdropView)
        
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: iconView.topAnchor)
        ])
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        titleLabel.textColor = .white
        
        
        addSubview(adultLabel)
        adultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adultLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            adultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
        adultLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        adultLabel.textColor = .white // You can set your preferred color here
        
        addSubview(voteAverageLabel)
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteAverageLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            voteAverageLabel.topAnchor.constraint(equalTo: adultLabel.bottomAnchor, constant: 4)
        ])
        voteAverageLabel.font = UIFont.systemFont(ofSize: 14)
        voteAverageLabel.textColor = .white
        
        addSubview(starView)
        starView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starView.leadingAnchor.constraint(equalTo: voteAverageLabel.trailingAnchor, constant: 4),
            starView.topAnchor.constraint(equalTo: adultLabel.bottomAnchor, constant: 4)
        ])
        starView.font = UIFont.systemFont(ofSize: 14)
        starView.textColor = UIColor.systemOrange
        
        
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: iconView.bottomAnchor, constant: -4)
        ])
        dateLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        dateLabel.textColor = .white
        
        // Add overviewLabel
        addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            overviewLabel.topAnchor.constraint(equalTo: starView.bottomAnchor, constant: 4),
            overviewLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -4)
        ])
        overviewLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        overviewLabel.textColor = .lightText
        overviewLabel.numberOfLines = 0 // Allow multiple lines for overview text
        
    }
    
    private func configureCell(data: CustomCellViewModel) {
        titleLabel.text = data.title
        overviewLabel.text = data.overview
        adultLabel.text = data.adult == true ? "(Adult)" : "(Not Adult)"
        iconView.kf.setImage(with: URL(string: ImagePath + data.posterPath))
        backdropView.kf.setImage(with: URL(string: ImagePath + data.backdropPath))
        voteAverageLabel.text = String(data.voteAverage)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let dateString = data.releaseDate
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {
            let formattedDate = dateFormatter.string(from: date)
            dateLabel.text = formattedDate
        }
        
        let starFilled = "★"
        let starEmpty = "☆"
        
        let voteAverage = data.voteAverage
        let numberOfFilledStars = Int(voteAverage / 2)
        let filledStars = String(repeating: starFilled, count: numberOfFilledStars)
        let emptyStars = String(repeating: starEmpty, count: 5 - numberOfFilledStars)
        let starRatingText = filledStars + emptyStars
        starView.text = starRatingText
    
    }
}

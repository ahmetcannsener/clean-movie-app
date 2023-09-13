//
//  CustomHeaderCell.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import UIKit
import Kingfisher

protocol CustomHeaderCellDelegate: AnyObject {
    func didTapCloseButton()
}

final class CustomHeaderCell: UITableViewCell {
    
    private let contentViewContainer: UIView = UIView()
    private let iconView: UIImageView = UIImageView()
    private var ImagePath: String = "https://image.tmdb.org/t/p/w500"
    
    weak var delegate: CustomHeaderCellDelegate?
    
    var viewModel: CustomHeaderCellViewModel? {
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
        
        contentView.addSubview(contentViewContainer)
        contentViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentViewContainer.topAnchor.constraint(equalTo: topAnchor),
            contentViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        contentViewContainer.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: contentViewContainer.topAnchor),
            iconView.leadingAnchor.constraint(equalTo: contentViewContainer.leadingAnchor),
            iconView.trailingAnchor.constraint(equalTo: contentViewContainer.trailingAnchor),
            iconView.bottomAnchor.constraint(equalTo: contentViewContainer.bottomAnchor),
        ])
        iconView.clipsToBounds = true
        iconView.contentMode = .scaleToFill
        
    }
    
    private func configureCell(data: CustomHeaderCellViewModel) {
        iconView.kf.setImage(with: URL(string: ImagePath + data.iconURL))
    }
    
    
}

//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Imanol Ortiz on 24/6/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    lazy var ratingLabel: UILabel = {
        let rating = UILabel()
        return rating
    }()
    
    lazy var vstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        addSubview(titleLabel)
        addSubview(ratingLabel)
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        vstack.frame = CGRect(x:5, y:5, width: .infinity, height: contentView.frame.size.height-10)
        
    }
    
    func setData(movie:Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = String(movie.rating)
    }
    
    
    //de momento nada
    func setTitleConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo:centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 19/9).isActive = true
    }
    
    
}

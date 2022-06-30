//
//  DetailsViewController.swift
//  MoviesApp
//
//  Created by Imanol Ortiz on 24/6/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController{
    
    private var movie: Movie
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = movie.title
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.load(from: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.imageUrl)")!)
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var overviewLabel: UILabel = {
        let overview = UILabel()
        overview.text = movie.overview
        overview.translatesAutoresizingMaskIntoConstraints = false
        return overview
    }()
    
    lazy var vstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .systemPurple
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpConstraints()
    }
    
    private func setUpView() {
        view.addSubview(vstack)
        vstack.addArrangedSubview(titleLabel)
        vstack.addArrangedSubview(overviewLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            vstack.leadingAnchor.constraint(equalToSystemSpacingAfter: vstack.leadingAnchor, multiplier: 20),
            vstack.trailingAnchor.constraint(equalToSystemSpacingAfter: vstack.trailingAnchor, multiplier: 20),
            view.centerYAnchor.constraint(equalTo: vstack.centerYAnchor)
        ])
    }
}

extension UIImageView {
    func load(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//
//  ViewController.swift
//  MoviesApp
//
//  Created by Imanol Ortiz on 24/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var movies: [Movie]?
    
    private lazy var moviesTableView: UITableView = {
        let movies = UITableView()
        movies.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        movies.translatesAutoresizingMaskIntoConstraints = false
        return movies
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        setUpView()
        setUpConstraints()
        loadMovies()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: movies![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        moviesTableView.deselectRow(at: indexPath, animated: true)
        print("Tapped: \(movies?[indexPath.row].title ?? "" )")
        self.navigationController?.pushViewController(DetailsViewController(movie: (movies![indexPath.row])), animated: false)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    private func setUpView(){
        view.addSubview(moviesTableView)
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func loadMovies(){
        ApiService().fetchFilms{ [weak self] (movies) in
            self?.movies = movies
            DispatchQueue.main.async {
                self?.moviesTableView.reloadData()
            }
        }
    }

}


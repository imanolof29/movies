//
//  ViewController.swift
//  MoviesApp
//
//  Created by Imanol Ortiz on 24/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var movies: [Movie]?
    
    lazy var moviesTableView: UITableView = {
        let movies = UITableView()
        movies.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return movies
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        view.addSubview(moviesTableView)
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        ApiService().fetchFilms{ [weak self] (movies) in
            self?.movies = movies
            DispatchQueue.main.async {
                self?.moviesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        moviesTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else{
            return UITableViewCell()
        }
        cell.setData(movie: movies![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        moviesTableView.deselectRow(at: indexPath, animated: true)
        print("Tapped: \(movies?[indexPath.row].title ?? "" )")
    }
    
    @objc func navigate(sender: UITableView){
        navigationController?.pushViewController(DetailsViewController(), animated: true)
    }

}


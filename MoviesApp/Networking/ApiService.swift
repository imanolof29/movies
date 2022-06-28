//
//  ApiService.swift
//  MoviesApp
//
//  Created by Imanol Ortiz on 24/6/22.
//

import Foundation

class ApiService{
    
    private var dataTask: URLSessionDataTask?
    
    private let moviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=98fee347b91da83932ea8b9daa0edece"
    
    func fetchFilms(completionHandler: @escaping ([Movie]) -> Void) {
        let url = URL(string: moviesURL)!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching movies: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response)")
            return
          }

          if let data = data,
            let response = try? JSONDecoder().decode(Response.self, from: data) {
            completionHandler(response.movies)
          }
        })
        task.resume()
      }

}

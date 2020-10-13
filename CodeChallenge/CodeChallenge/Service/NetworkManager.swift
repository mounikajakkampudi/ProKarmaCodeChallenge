//
//  NetworkManager.swift
//  CodeChallenge
//
//  Created by Mounika Jakkampudi on 10/9/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import Foundation
import Reachability

public enum HTTPError: Error {
     case invalidURL
     case invalidResponse(Data?, URLResponse?)
     case networkError
 }
extension HTTPError: LocalizedError {
     public var errorDescription: String? {
         switch self {
         case .invalidURL:
             return NSLocalizedString("Invalid URL", comment: "invalidURL")
         case .invalidResponse(_, _):
             return NSLocalizedString("Invalid Response", comment: "invalidResponse")
         case .networkError:
             return NSLocalizedString("Network Error", comment: "networkError")
         }
     }
 }

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    
    public func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        let reachability = try! Reachability()

        guard reachability.connection != .unavailable else {
            completionBlock(.failure(HTTPError.networkError))
            return
        }
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(HTTPError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }
            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                    return
            }
            completionBlock(.success(responseData))
        }
        task.resume()
    }
}

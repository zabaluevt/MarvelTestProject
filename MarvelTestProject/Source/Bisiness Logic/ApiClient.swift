//
//  ApiClient.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 18.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import Foundation

/// Клиент для работы с API
final class ApiClient {

    // MARK: - Private Properties

    private var baseUrlString: String
    private var cache: MD5

    private(set) lazy var session = URLSession(configuration: .ephemeral)

    // MARK: - Initializers

    init(baseUrlString: String, cache: MD5) {
        self.baseUrlString = baseUrlString
        self.cache = cache
    }

    /// Запрос в сеть
    func request<T>(
        _ endpoint: T,
        resultHandler: @escaping (Result<T.Content, NetworkError>) -> Void) where T: Endpoint {

        guard
            var request = try? endpoint.makeRequest(),
            let url = makeUrl(for: request)
        else {
            resultHandler(.failure(.requestError))
            return
        }
        
        request.url = url
        
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    resultHandler(.failure(.requestError))
                    return
                }

                guard let data = data else {
                    resultHandler(.failure(.noDataError))
                    return
                }

                do {
                    let responseModel = try endpoint.parse(from: response, with: data)
                    resultHandler(.success(responseModel))
                } catch let networkError {
                    guard let networkError = networkError as? NetworkError else {
                        resultHandler(.failure(.unknownError))
                        return
                    }
                    resultHandler(.failure(networkError))
                }
            }
        }.resume()
    }
    
    private func makeUrl(for request: URLRequest) -> URL? {
        
        guard
            let baseUrl = URL(string: baseUrlString + (request.url?.absoluteString ?? "")),
            var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        else {
            return nil
        }
        
        var urlQueryItems: [URLQueryItem] {
            [
                URLQueryItem(name: "apikey", value: cache.publicKey),
                URLQueryItem(name: "ts", value: cache.makeTimeStampString()),
                URLQueryItem(name: "hash", value: cache.makeHashValue())
            ]
        }
        
        components.queryItems = components.queryItems != nil
            ? components.queryItems! + urlQueryItems
            : urlQueryItems
        
        return components.url
    }
}

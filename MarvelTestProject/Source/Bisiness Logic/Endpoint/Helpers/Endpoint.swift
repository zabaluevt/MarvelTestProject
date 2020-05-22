//
//  Endpoint.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 18.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import Foundation

/// Протокол для Endpoint
protocol Endpoint {

    associatedtype Content

    /// Создание request
    func makeRequest() throws -> URLRequest

    /// Парсинг
    func parse(from response: URLResponse?, with body: Data) throws -> Content
}

extension Endpoint {
    
    /// Метод создает URL содержащий относительный путь до api метода
    func makeRelativeUrl(path: String, queryItems: [URLQueryItem] = []) throws -> URL {

        guard
            let pathUrl = URL(string: path),
            var components = URLComponents(url: pathUrl, resolvingAgainstBaseURL: true)
        else {
            throw NetworkError.requestError
        }

        components.queryItems = queryItems

        guard let url = components.url else {
            throw NetworkError.requestError
        }

        return url
    }

    /// Создание реквеста Get запроса
    func makeGetRequest(path: String, queryItems: [URLQueryItem] = []) throws -> URLRequest {
        let url = try makeRelativeUrl(path: path, queryItems: queryItems)
        var request = URLRequest(url: url)
        request.setValue(EndpointConstants.applicationJson, forHTTPHeaderField: EndpointConstants.contentType)
        return request
    }
}

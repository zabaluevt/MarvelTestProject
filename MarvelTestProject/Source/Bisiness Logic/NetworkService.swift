//
//  NetworkService.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 18.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import Foundation

/// Сервис для работы с сервером
final class NetworkService {

    // MARK: - Private Properties

    private let apiClient: ApiClient

    // MARK: - Initializers

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    // MARK: - Public Methods

    /// Получаем персонажений по страницам
    func fetchCharacters(by page: Int, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        let endpoint = CharactersEndpoint(page: page)
        apiClient.request(endpoint, resultHandler: completion)
    }
}

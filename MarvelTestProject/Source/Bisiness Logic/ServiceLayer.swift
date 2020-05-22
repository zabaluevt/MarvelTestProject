//
//  ServiceLayer.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 18.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import Foundation

/// Основной класс для работы с сетью
final class ServiceLayer {

    // MARK: - Public Properties

    static let shared = ServiceLayer()

    // MARK: - Private Properties
    
    private let cache = MD5(
        publicKey: EndpointConstants.publicKey,
        privateKey: EndpointConstants.privateKey,
        date: Date())

    private lazy var apiClient = ApiClient(baseUrlString: "https://gateway.marvel.com/", cache: cache)
    private(set) lazy var networkService = NetworkService(apiClient: apiClient)
}

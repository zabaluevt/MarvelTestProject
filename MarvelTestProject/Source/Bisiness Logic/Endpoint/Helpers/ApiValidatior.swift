//
//  ApiValidatior.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 18.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import Foundation

/// Валидатор ошибок от сервера
final class ApiValidatior {

    // MARK: - Public Methods

    /// Общая валидация
    static func validate(_ response: URLResponse?, with body: Data) throws {
        try validateHTTPstatus(response)
    }

    /// Валидация http status
    static func validateHTTPstatus(_ response: URLResponse?) throws {
         guard let httpResponse = response as? HTTPURLResponse,
            !(200...299 ~= httpResponse.statusCode) else { return }

        throw NetworkError.serverError(code: httpResponse.statusCode)
    }
}

//
//  SceneDelegate.swift
//  MarvelTestProject
//
//  Created by Тимофей Забалуев on 15.05.2020.
//  Copyright © 2020 Тимофей Забалуев. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.rootViewController = UINavigationController(rootViewController: HeroesViewController())
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}

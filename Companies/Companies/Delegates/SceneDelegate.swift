//
//  SceneDelegate.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var dependencyInjection: DependencyInjection?
    var assembler: Assembler?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)

        dependencyInjection = DependencyInjection(navigationController: UINavigationController())
        dependencyInjection?.build(completion: { (assembler, appCoordinator) in
            self.assembler = assembler
            window?.makeKeyAndVisible()
            window?.windowScene = windowScene
            window?.rootViewController = appCoordinator.navigationController
            appCoordinator.start()
        })
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}


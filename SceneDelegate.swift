//
//  SceneDelegate.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        // root
        let root = CoverViewController()        
        let router = UINavigationController(rootViewController: root)
        
        window.rootViewController = router
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

//
//  SceneDelegate.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 29.06.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene

		let navViewController = UINavigationController()
		let builder = MainBuilder()
		let router = Router(navigationController: navViewController, builder: builder)
		router.initialViewController()
		window?.rootViewController = navViewController
		window?.makeKeyAndVisible()
	}
	
	func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
		return .landscape
	}
	
}


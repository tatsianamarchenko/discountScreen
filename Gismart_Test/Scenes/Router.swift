//
//  Router.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 02.07.22.
//

import Foundation
import UIKit

protocol RouterMain {
	var navigationController: UINavigationController? {get set}
	var builder: Builder? { get set }
}

protocol RouterProtocol: RouterMain {
	func initialViewController()
	func popUViewController(message: String)
}

class Router: RouterProtocol {
	var navigationController: UINavigationController?
	var builder: Builder?
	
	init(navigationController: UINavigationController, builder: Builder) {
		self.navigationController = navigationController
		self.builder = builder
	}
	
	func initialViewController() {
		if let navigationController = navigationController  {
			guard let mainVC = builder?.createMain(router: self) else {
				return
			}
			navigationController.viewControllers = [mainVC]
		}
	}
	
	func popUViewController(message: String) {
		if let navigationController = navigationController  {
			guard let popupVC = builder?.createPopUp(router: self, message: message) else {
				return
			}
			popupVC.modalPresentationStyle = .overFullScreen
			navigationController.present(popupVC, animated: true)
		}
	}
}

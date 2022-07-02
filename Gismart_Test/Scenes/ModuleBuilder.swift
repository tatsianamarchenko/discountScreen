//
//  ModuleBuilder.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 02.07.22.
//

import Foundation
import UIKit

protocol Builder {
	func createMain(router: RouterProtocol) -> UIViewController
	func createPopUp(router: RouterProtocol, message: String) -> UIViewController
}

class MainBuilder: Builder {

	func createMain(router: RouterProtocol) -> UIViewController {
		let vc = DiscountView()
		let customPopUp = PopupScreenView()
		let timerManager = TimerManager(timerValue: 86400, timerView: vc.timer)
		let presenter = DiscountPresenter(view: vc, router: router, customAlert: customPopUp, timerManager: timerManager)
		vc.presenter = presenter
		return vc
	}

	func createPopUp(router: RouterProtocol, message: String) -> UIViewController {
		let vc = PopupScreenView()
		vc.messageLable.text = message
		let presenter = PopupPresenter(view: vc, router: router)
		vc.presenter = presenter
		return vc
	}
}

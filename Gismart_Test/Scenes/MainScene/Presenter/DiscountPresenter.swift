//
//  DiscountPresenter.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 02.07.22.
//

import Foundation

protocol DiscountPresenterProtocol: AnyObject {
	init(view: DiscountViewProtocol, router: RouterProtocol, timerManager: TimerManager)
	func showActivationTime()
}

class DiscountPresenter: DiscountPresenterProtocol {
	
	weak var view: DiscountViewProtocol?
	var router: RouterProtocol
	let timerManager: TimerManager
	
	required init(view: DiscountViewProtocol, router: RouterProtocol, timerManager: TimerManager) {
		self.view = view
		self.router = router
		self.timerManager = timerManager
	}
	
	func showActivationTime() {
		timerManager.dateToTransfer { [weak self] daysLeft ,houseLeft, minutesLeft, secondsLeft  in
			self?.router.popUViewController(message: "Offer activated at \(daysLeft)\(houseLeft)\(minutesLeft)\(secondsLeft)")
		}
	}
}

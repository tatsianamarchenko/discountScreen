//
//  PopupPresenter.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 2.07.22.
//

import Foundation


import Foundation

protocol PopupPresenterProtocol: AnyObject {
	init(view: PopupScreenViewProtocol, router: RouterProtocol)
}

class PopupPresenter: PopupPresenterProtocol {

	weak var view: PopupScreenViewProtocol?
	var router: RouterProtocol

	required init(view: PopupScreenViewProtocol, router: RouterProtocol) {
		self.view = view
		self.router = router
	}
}

//
//  PopupScreenView.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 30.06.22.
//

import Foundation
import UIKit

protocol PopupScreenViewProtocol: UIViewController {
}

class PopupScreenView: UIViewController, PopupScreenViewProtocol {
	var presenter: PopupPresenterProtocol?
	private var backgroundView: UIView = {
		var backgroundView = UIView()
		backgroundView.backgroundColor = .black
		backgroundView.translatesAutoresizingMaskIntoConstraints = false
		backgroundView.alpha = 0.8
		return backgroundView
	}()
	
	private var alertView: UIView = {
		var alert = UIView()
		alert.backgroundColor = #colorLiteral(red: 0.002419039607, green: 0.05299315602, blue: 0.3073753715, alpha: 1)
		alert.translatesAutoresizingMaskIntoConstraints = false
		alert.layer.masksToBounds = true
		alert.layer.cornerRadius = 16
		return alert
	}()
	
	private var titleLable: UILabel = {
		let lable = UILabel()
		lable.textColor = .white
		lable.text = "Great!"
		lable.textAlignment = .center
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.font = .systemFont(ofSize: 35, weight: .bold)
		lable.createShadow(shadowBlurRadius: 25, shadowColor: .blue)
		return lable
	}()
	
	private var messageLable: UILabel = {
		let lable = UILabel()
		lable.numberOfLines = 0
		lable.textColor = .white
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.font = .systemFont(ofSize: 20, weight: .semibold)
		lable.textAlignment = .center
		return lable
	}()

	private func layoutTrait(traitCollection:UITraitCollection) {
		if traitCollection.horizontalSizeClass == .regular || traitCollection.verticalSizeClass == .regular {
			titleLable.font = .systemFont(ofSize: 45, weight: .bold)
			messageLable.font = .systemFont(ofSize: 25, weight: .semibold)
		}
	}

	func setMessage(message: String) {
		messageLable.text = message
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(backgroundView)
		view.addSubview(alertView)
		alertView.addSubview(titleLable)
		alertView.addSubview(messageLable)
		
		NSLayoutConstraint.activate([
			backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			alertView.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
			alertView.heightAnchor.constraint(equalToConstant: view.frame.size.height/3),
			
			titleLable.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
			titleLable.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
			titleLable.bottomAnchor.constraint(equalTo: alertView.centerYAnchor, constant: -5),
			
			messageLable.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 5),
			messageLable.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -5),
			messageLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5)
		])
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		layoutTrait(traitCollection: traitCollection)
	}
}

//
//  OfferActivatedViewController.swift
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
	var backgroundView: UIView = {
		var backgroundView = UIView()
		backgroundView.backgroundColor = .black
		backgroundView.translatesAutoresizingMaskIntoConstraints = false
		backgroundView.alpha = 0
		return backgroundView
	}()
	
	private var alertView: UIView = {
		var alert = UIView()
		alert.backgroundColor = #colorLiteral(red: 0.002419039607, green: 0.05299315602, blue: 0.3073753715, alpha: 1)
		alert.translatesAutoresizingMaskIntoConstraints = false
		alert.layer.masksToBounds = true
		alert.layer.cornerRadius = 12
		return alert
	}()
	
	var titleLable: UILabel = {
		let lable = UILabel()
		lable.textColor = .white
		lable.text = "Great"
		lable.textAlignment = .center
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.font = .systemFont(ofSize: 35, weight: .bold)
		lable.createShadow(shadowBlurRadius: 20, shadowColor: .blue)
		return lable
	}()
	
	var messageLable: UILabel = {
		let lable = UILabel()
		lable.numberOfLines = 0
		lable.textColor = .white
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.font = .systemFont(ofSize: 20, weight: .semibold)
		lable.textAlignment = .center
		return lable
	}()
	
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
			
			alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:view.frame.size.width/3),
			alertView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height/3),
			alertView.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
			alertView.heightAnchor.constraint(equalToConstant: view.frame.size.height/3),
			
			titleLable.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
			titleLable.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
			titleLable.bottomAnchor.constraint(equalTo: alertView.centerYAnchor, constant: -10),
			
			messageLable.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
			messageLable.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
			messageLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 15)
		])
	}
}

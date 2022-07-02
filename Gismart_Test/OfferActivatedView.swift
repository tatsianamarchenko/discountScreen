//
//  OfferActivatedViewController.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 30.06.22.
//

import Foundation
import UIKit

class OfferActivatedView: UIView {

	var backgroundView: UIView = {
		var backgroundView = UIView()
		backgroundView.backgroundColor = .black
		backgroundView.alpha = 0
		return backgroundView
	}()

	private var alertView: UIView = {
		var alert = UIView()
		alert.backgroundColor = #colorLiteral(red: 0.002419039607, green: 0.05299315602, blue: 0.3073753715, alpha: 1)
		alert.layer.masksToBounds = true
		alert.layer.cornerRadius = 12
		return alert
	}()

	var titleLable: UILabel!
	var messageLable: UILabel!

	private var myTargetView: UIView?
	
	func showAlert(with title: String, message: String, onView: UIViewController) {

		guard let targetView = onView.view else {
			return
		}
		myTargetView = targetView

		backgroundView.frame = targetView.bounds
		targetView.addSubview(backgroundView)

		targetView.addSubview(alertView)
		alertView.frame = CGRect(x: 40,
								 y: -300,
								 width: targetView.frame.size.width/3,
								 height: targetView.frame.size.height/3)

		 titleLable = UILabel(frame: CGRect(x: 0,
											   y: 0,
											   width: alertView.frame.size.width,
											   height: alertView.frame.size.height/2+30))

		titleLable.text = title
		titleLable.textColor = .white
		titleLable.textAlignment = .center
		titleLable.font = .systemFont(ofSize: 35, weight: .bold)
		titleLable.createShadow(shadowBlurRadius: 20, shadowColor: .blue)
		alertView.addSubview(titleLable)

		 messageLable = UILabel(frame: CGRect(x: 0,
												 y: 80,
												 width: alertView.frame.size.width,
												 height: alertView.frame.size.height/2-20))

		messageLable.numberOfLines = 0
		messageLable.text = message
		messageLable.textColor = .white
		messageLable.font = .systemFont(ofSize: 20, weight: .semibold)
		messageLable.textAlignment = .center
		alertView.addSubview(messageLable)

		UIView.animate(withDuration: 0.25,
					   animations: {
			self.backgroundView.alpha = 0.6
		}) { done in
			if done {
				UIView.animate(withDuration: 0.25) {
					self.alertView.center = targetView.center
				}
			}
		}
	}

	func dismissAlert() {

		guard let targetView = myTargetView else {
			return
		}

		UIView.animate(withDuration: 0.01,
					   animations: {
			self.alertView.frame = CGRect(x: 40,
										  y: targetView.frame.size.height,
										  width: targetView.frame.size.width-80,
										  height: 300)
		}, completion: { done in
			if done {
				UIView.animate(withDuration: 0.01, animations: {
					self.backgroundView.alpha = 0
				}) { done in
					if done {
						self.alertView.removeFromSuperview()
						self.backgroundView.removeFromSuperview()
						self.titleLable.text = ""
						self.messageLable.text = ""
					}
				}
			}
		})
	}
}

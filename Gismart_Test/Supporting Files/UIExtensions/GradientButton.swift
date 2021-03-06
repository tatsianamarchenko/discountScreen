//
//  GradientButton.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 2.07.22.
//

import Foundation
import UIKit

class GradientButton: UIButton {

	override func layoutSubviews() {
		super.layoutSubviews()
		gradientLayer.frame = bounds
	}

	private lazy var gradientLayer: CAGradientLayer = {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = self.bounds
		let blue = #colorLiteral(red: 0.2575358152, green: 0.2706360817, blue: 0.6008356214, alpha: 1).cgColor
		let pink = #colorLiteral(red: 0.987001121, green: 0.2012993395, blue: 0.7515467405, alpha: 1).cgColor
		gradientLayer.colors = [blue, pink]
		gradientLayer.startPoint = CGPoint(x: 0, y: 0)
		gradientLayer.endPoint = CGPoint(x: 0, y: 1)
		gradientLayer.cornerRadius = 16
		layer.insertSublayer(gradientLayer, at: 0)
		return gradientLayer
	}()
}

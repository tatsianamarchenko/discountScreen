//
//  Animation.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 30.06.22.
//

import Foundation
import UIKit

extension UILabel {
	func wheelAnimation() {
		let animation: CATransition = CATransition()
		animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
		animation.type = CATransitionType.push
		animation.subtype = CATransitionSubtype.fromBottom
		animation.duration = 0.3
		layer.add(animation, forKey: CATransitionType.push.rawValue)
	}

	func createShadow(shadowBlurRadius: CGFloat, shadowColor: UIColor) {
		let shadow = NSShadow()
		shadow.shadowColor = shadowColor
		shadow.shadowBlurRadius = shadowBlurRadius
		let attrs: [NSAttributedString.Key: Any] = [
			.shadow: shadow
		]
		let attributedText = NSAttributedString(string: text ?? "", attributes: attrs)
		self.attributedText = attributedText
	}
}

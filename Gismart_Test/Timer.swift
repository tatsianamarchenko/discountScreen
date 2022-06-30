//
//  Timer.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 30.06.22.
//

import Foundation
import UIKit

class TimerView: UIView {

	var timer: Timer?
	private var timerValue = 86400

	var dayLable: UILabel!
	var hoursLable: UILabel!
	var minutesLable: UILabel!
	var secondsLable: UILabel!

	private	func createView() -> UIView {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = #colorLiteral(red: 0.1686274707, green: 0.1686274707, blue: 0.1686274707, alpha: 1)
		view.layer.cornerRadius = 12
		return view
	}

	private func createColonLable () -> UILabel {
		let lable = UILabel()
		lable.text = ":"
		lable.textColor = .white
		lable.textAlignment = .center
		lable.translatesAutoresizingMaskIntoConstraints = false
		return lable
	}

	private	func createLable() -> UILabel {
		let lable = UILabel()
		lable.textColor = .white
		lable.textAlignment = .center

		lable.translatesAutoresizingMaskIntoConstraints = false
		return lable
	}

	func runTimer() {
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
	}

	@objc func updateTimer() {
		if timerValue < 1 {
			timer?.invalidate()
		} else {
			timerValue -= 1
			timeString(time: TimeInterval(timerValue), handler: { [weak self] (days, hours, minutes, seconds) in

				if self?.dayLable.text != days{
					self?.dayLable.wheelAnimation()
				}
				if self?.hoursLable.text != hours{
					self?.hoursLable.wheelAnimation()
				}
				if self?.minutesLable.text != minutes{
					self?.minutesLable.wheelAnimation()
				}
				if self?.secondsLable.text != seconds{
					self?.secondsLable.wheelAnimation()
				}

				self?.dayLable.text = days
				self?.hoursLable.text = hours
				self?.minutesLable.text = minutes
				self?.secondsLable.text = seconds
			})
		}
	}

	private func timeString(time:TimeInterval, handler: @escaping (String, String, String, String) -> Void) {
		let days = Int(time) / 86400
		let hours = Int(time) / 3600
		let minutes = Int(time) / 60 % 60
		let seconds = Int(time) % 60
		handler(String(format:"%02i", days),
				String(format:"%02i", hours),
				String(format:"%02i", minutes),
				String(format:"%02i", seconds))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		dayLable = createLable()
		hoursLable = createLable()
		minutesLable = createLable()
		secondsLable = createLable()
		runTimer()

		let dayView = createView()
		let hoursView = createView()
		let minutesView = createView()
		let secondsView = createView()
		let firstColon = createColonLable()
		let secondColon = createColonLable()
		let thirdColon = createColonLable()
		dayView.addSubview(dayLable)
		hoursView.addSubview(hoursLable)
		minutesView.addSubview(minutesLable)
		secondsView.addSubview(secondsLable)
		addSubview(dayView)
		addSubview(firstColon)
		addSubview(hoursView)
		addSubview(secondColon)
		addSubview(minutesView)
		addSubview(thirdColon)
		addSubview(secondsView)

		NSLayoutConstraint.activate([
			dayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
			dayView.heightAnchor.constraint(equalToConstant: 41),
			dayView.widthAnchor.constraint(equalToConstant: 62.5)
		])

		NSLayoutConstraint.activate([
			dayLable.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
			dayLable.centerYAnchor.constraint(equalTo: dayView.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			hoursLable.centerXAnchor.constraint(equalTo: hoursView.centerXAnchor),
			hoursLable.centerYAnchor.constraint(equalTo: hoursView.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			minutesLable.centerXAnchor.constraint(equalTo: minutesView.centerXAnchor),
			minutesLable.centerYAnchor.constraint(equalTo: minutesView.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			secondsLable.centerXAnchor.constraint(equalTo: secondsView.centerXAnchor),
			secondsLable.centerYAnchor.constraint(equalTo: secondsView.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			firstColon.leadingAnchor.constraint(equalTo: dayView.trailingAnchor, constant: 3),
			firstColon.heightAnchor.constraint(equalToConstant: 41),
			firstColon.widthAnchor.constraint(equalToConstant: 3)
		])

		NSLayoutConstraint.activate([
			hoursView.leadingAnchor.constraint(equalTo: firstColon.trailingAnchor, constant: 3),
			hoursView.heightAnchor.constraint(equalToConstant: 41),
			hoursView.widthAnchor.constraint(equalToConstant: 62.5)
		])

		NSLayoutConstraint.activate([
			secondColon.leadingAnchor.constraint(equalTo: hoursView.trailingAnchor, constant: 3),
			secondColon.heightAnchor.constraint(equalToConstant: 41),
			secondColon.widthAnchor.constraint(equalToConstant: 3)
		])

		NSLayoutConstraint.activate([
			minutesView.leadingAnchor.constraint(equalTo: secondColon.trailingAnchor, constant: 3),
			minutesView.heightAnchor.constraint(equalToConstant: 41),
			minutesView.widthAnchor.constraint(equalToConstant: 62.5)
		])

		NSLayoutConstraint.activate([
			thirdColon.leadingAnchor.constraint(equalTo: minutesView.trailingAnchor, constant: 3),
			thirdColon.heightAnchor.constraint(equalToConstant: 41),
			thirdColon.widthAnchor.constraint(equalToConstant: 3)
		])

		NSLayoutConstraint.activate([
			secondsView.leadingAnchor.constraint(equalTo: thirdColon.trailingAnchor, constant: 3),
			secondsView.heightAnchor.constraint(equalToConstant: 41),
			secondsView.widthAnchor.constraint(equalToConstant: 62.5)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension UILabel {
	func wheelAnimation() {
		let animation: CATransition = CATransition()
		animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
		animation.type = CATransitionType.push
		animation.subtype = CATransitionSubtype.fromBottom
		animation.duration = 0.3
		layer.add(animation, forKey: CATransitionType.push.rawValue)
	}
}

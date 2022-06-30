//
//  Timer.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 30.06.22.
//

import Foundation
import UIKit

class TimerView: UIView {

	private var timer: TimerManager?
	private var dayLable: UILabel!
	private var hoursLable: UILabel!
	private var minutesLable: UILabel!
	private var secondsLable: UILabel!

	private var dayView: UIView!
	private var hoursView: UIView!
	private var minutesView: UIView!
	private var secondsView: UIView!
	private var firstColon: UIView!
	private var secondColon: UIView!
	private var thirdColon: UIView!

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

	override init(frame: CGRect) {
		super.init(frame: frame)

		dayLable = createLable()
		hoursLable = createLable()
		minutesLable = createLable()
		secondsLable = createLable()
		dayView = createView()
		hoursView = createView()
		minutesView = createView()
		secondsView = createView()
		firstColon = createColonLable()
		secondColon = createColonLable()
		thirdColon = createColonLable()

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

		makeConstraints()
		timer = TimerManager(timerValue: 86400,
							 dayLable: dayLable,
							 hoursLable: hoursLable,
							 minutesLable: minutesLable,
							 secondsLable: secondsLable)
		timer?.runTimer()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func dateToTransfer(complition: @escaping(String, String, String)->Void) {
		guard let hours = hoursLable.text else {
			return
		}
		var houseLeft = "\(hours) :"
		guard let minutes = minutesLable.text else {
			return
		}
		var minutesLeft = "\(minutes) :"
		guard let secondsLeft = secondsLable.text else {
			return
		}
		if houseLeft == "00 :" {
			houseLeft = ""
		}
		if minutesLeft == "00 :" {
			minutesLeft = ""
		}
		complition(houseLeft, minutesLeft, secondsLeft)
	}

	private func makeConstraints() {
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
}

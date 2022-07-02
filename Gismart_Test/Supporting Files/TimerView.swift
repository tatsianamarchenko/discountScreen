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
		addSubview(viewContainer)
		viewContainer.addSubview(dayView)
		viewContainer.addSubview(firstColon)
		viewContainer.addSubview(hoursView)
		viewContainer.addSubview(secondColon)
		viewContainer.addSubview(minutesView)
		viewContainer.addSubview(thirdColon)
		viewContainer.addSubview(secondsView)

		//			makeConstraints()
		setupConstraints()

		NSLayoutConstraint.activate(sharedConstraints)
		layoutTrait(traitCollection: UIScreen.main.traitCollection)

		timer = TimerManager(timerValue: 86400,
							 dayLable: dayLable,
							 hoursLable: hoursLable,
							 minutesLable: minutesLable,
							 secondsLable: secondsLable)
		timer?.runTimer()
	}

	private lazy var viewContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func dateToTransfer(complition: @escaping(String, String, String)->Void) {
		guard let hours = hoursLable.text else {
			return
		}
		var houseLeft = "\(hours):"
		guard let minutes = minutesLable.text else {
			return
		}
		var minutesLeft = "\(minutes):"
		guard let secondsLeft = secondsLable.text else {
			return
		}
		if houseLeft == "00:" {
			houseLeft = ""
		}
		if minutesLeft == "00:" {
			minutesLeft = ""
		}
		complition(houseLeft, minutesLeft, secondsLeft)
	}

	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []
	private var sharedConstraints: [NSLayoutConstraint] = []

	func setupConstraints() {
		sharedConstraints.append(contentsOf: [
			dayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
			dayLable.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
			dayLable.centerYAnchor.constraint(equalTo: dayView.centerYAnchor),
			hoursLable.centerXAnchor.constraint(equalTo: hoursView.centerXAnchor),
			hoursLable.centerYAnchor.constraint(equalTo: hoursView.centerYAnchor),
			minutesLable.centerXAnchor.constraint(equalTo: minutesView.centerXAnchor),
			minutesLable.centerYAnchor.constraint(equalTo: minutesView.centerYAnchor),
			secondsLable.centerXAnchor.constraint(equalTo: secondsView.centerXAnchor),
			secondsLable.centerYAnchor.constraint(equalTo: secondsView.centerYAnchor),
			firstColon.leadingAnchor.constraint(equalTo: dayView.trailingAnchor, constant: 3),
			firstColon.widthAnchor.constraint(equalToConstant: 3),
			hoursView.leadingAnchor.constraint(equalTo: firstColon.trailingAnchor, constant: 3),
			secondColon.leadingAnchor.constraint(equalTo: hoursView.trailingAnchor, constant: 3),
			secondColon.widthAnchor.constraint(equalToConstant: 3),
			minutesView.leadingAnchor.constraint(equalTo: secondColon.trailingAnchor, constant: 3),
			thirdColon.leadingAnchor.constraint(equalTo: minutesView.trailingAnchor, constant: 3),
			secondsView.leadingAnchor.constraint(equalTo: thirdColon.trailingAnchor, constant: 3),
		])

		regularConstraints.append(contentsOf: [
			dayView.heightAnchor.constraint(equalToConstant: 57),
			dayView.widthAnchor.constraint(equalToConstant: 90),
			firstColon.heightAnchor.constraint(equalToConstant: 57),
			hoursView.heightAnchor.constraint(equalToConstant: 57),
			hoursView.widthAnchor.constraint(equalToConstant: 90),
			secondColon.heightAnchor.constraint(equalToConstant: 57),

			minutesView.heightAnchor.constraint(equalToConstant: 57),
			minutesView.widthAnchor.constraint(equalToConstant: 90),
			thirdColon.heightAnchor.constraint(equalToConstant: 57),
			secondsView.heightAnchor.constraint(equalToConstant: 57),
			secondsView.widthAnchor.constraint(equalToConstant: 90)
		])

		compactConstraints.append(contentsOf: [
			dayView.heightAnchor.constraint(equalToConstant: 41),
			dayView.widthAnchor.constraint(equalToConstant: 62.5),
			firstColon.heightAnchor.constraint(equalToConstant: 41),
			hoursView.heightAnchor.constraint(equalToConstant: 41),
			hoursView.widthAnchor.constraint(equalToConstant: 62.5),
			secondColon.heightAnchor.constraint(equalToConstant: 41),

			minutesView.heightAnchor.constraint(equalToConstant: 41),
			minutesView.widthAnchor.constraint(equalToConstant: 62.5),
			thirdColon.heightAnchor.constraint(equalToConstant: 41),
			secondsView.heightAnchor.constraint(equalToConstant: 41),
			secondsView.widthAnchor.constraint(equalToConstant: 62.5)
		])
	}

	func layoutTrait(traitCollection:UITraitCollection) {
		if (!sharedConstraints[0].isActive) {
			NSLayoutConstraint.activate(sharedConstraints)
		}
		if traitCollection.horizontalSizeClass == .compact || traitCollection.verticalSizeClass == .compact {
			if regularConstraints.count > 0 && regularConstraints[0].isActive {
				NSLayoutConstraint.deactivate(regularConstraints)
			}
			NSLayoutConstraint.activate(compactConstraints)
		} else {
			if compactConstraints.count > 0 && compactConstraints[0].isActive {
				NSLayoutConstraint.deactivate(compactConstraints)
			}
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)

		layoutTrait(traitCollection: traitCollection)
	}
	
	//		private func makeConstraints() {
	//			NSLayoutConstraint.activate([
	//				dayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
	//				dayView.heightAnchor.constraint(equalToConstant: 41),
	//				dayView.widthAnchor.constraint(equalToConstant: 62.5),
	//
	//				dayLable.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
	//				dayLable.centerYAnchor.constraint(equalTo: dayView.centerYAnchor),
	//
	//				hoursLable.centerXAnchor.constraint(equalTo: hoursView.centerXAnchor),
	//				hoursLable.centerYAnchor.constraint(equalTo: hoursView.centerYAnchor),
	//
	//				minutesLable.centerXAnchor.constraint(equalTo: minutesView.centerXAnchor),
	//				minutesLable.centerYAnchor.constraint(equalTo: minutesView.centerYAnchor),
	//
	//				secondsLable.centerXAnchor.constraint(equalTo: secondsView.centerXAnchor),
	//				secondsLable.centerYAnchor.constraint(equalTo: secondsView.centerYAnchor),
	//
	//				firstColon.leadingAnchor.constraint(equalTo: dayView.trailingAnchor, constant: 3),
	//				firstColon.heightAnchor.constraint(equalToConstant: 41),
	//				firstColon.widthAnchor.constraint(equalToConstant: 3),
	//
	//				hoursView.leadingAnchor.constraint(equalTo: firstColon.trailingAnchor, constant: 3),
	//				hoursView.heightAnchor.constraint(equalToConstant: 41),
	//				hoursView.widthAnchor.constraint(equalToConstant: 62.5),
	//
	//				secondColon.leadingAnchor.constraint(equalTo: hoursView.trailingAnchor, constant: 3),
	//				secondColon.heightAnchor.constraint(equalToConstant: 41),
	//				secondColon.widthAnchor.constraint(equalToConstant: 3),
	//
	//				minutesView.leadingAnchor.constraint(equalTo: secondColon.trailingAnchor, constant: 3),
	//				minutesView.heightAnchor.constraint(equalToConstant: 41),
	//				minutesView.widthAnchor.constraint(equalToConstant: 62.5),
	//
	//				thirdColon.leadingAnchor.constraint(equalTo: minutesView.trailingAnchor, constant: 3),
	//				thirdColon.heightAnchor.constraint(equalToConstant: 41),
	//				thirdColon.widthAnchor.constraint(equalToConstant: 3),
	//
	//				secondsView.leadingAnchor.constraint(equalTo: thirdColon.trailingAnchor, constant: 3),
	//				secondsView.heightAnchor.constraint(equalToConstant: 41),
	//				secondsView.widthAnchor.constraint(equalToConstant: 62.5)
	//			])
	//		}
}

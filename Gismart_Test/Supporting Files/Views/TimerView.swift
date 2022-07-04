//
//  Timer.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 30.06.22.
//

import Foundation
import UIKit

class TimerView: UIView {
	
	var dayLable: UILabel!
	var hoursLable: UILabel!
	var minutesLable: UILabel!
	var secondsLable: UILabel!
	
	private var dayView: UIView!
	private var hoursView: UIView!
	private var minutesView: UIView!
	private var secondsView: UIView!
	private var firstColon: UILabel!
	private var secondColon: UILabel!
	private var thirdColon: UILabel!
	
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []
	private var sharedConstraints: [NSLayoutConstraint] = []
	
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
		firstColon = createLable()
		secondColon = createLable()
		thirdColon = createLable()
		firstColon.text = ":"
		secondColon.text = ":"
		thirdColon.text = ":"
		
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
		
		setupConstraints()
		
		NSLayoutConstraint.activate(sharedConstraints)
		layoutTrait(traitCollection: UIScreen.main.traitCollection)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func createView() -> UIView {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = #colorLiteral(red: 0.1686274707, green: 0.1686274707, blue: 0.1686274707, alpha: 1)
		view.layer.cornerRadius = 12
		return view
	}
	
	private func createLable() -> UILabel {
		let lable = UILabel()
		lable.textColor = .white
		lable.textAlignment = .center
		lable.font = .systemFont(ofSize: 15, weight: .bold)
		lable.translatesAutoresizingMaskIntoConstraints = false
		return lable
	}

	private func setupConstraints() {

		switch UIDevice.current.name {
		case Devices.iPhoneSE1.rawValue:
			compactConstraints.append(contentsOf: [
				dayView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhoneSE1),
				hoursView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhoneSE1),
				minutesView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhoneSE1),
				secondsView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhoneSE1)
			])
		default:
			compactConstraints.append(contentsOf: [
				dayView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhone),
				hoursView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhone),
				minutesView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhone),
				secondsView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPhone)
			])
		}

		sharedConstraints.append(contentsOf: [
			dayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.share.timerColonSpaceWidth),
			dayLable.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
			dayLable.centerYAnchor.constraint(equalTo: dayView.centerYAnchor),
			hoursLable.centerXAnchor.constraint(equalTo: hoursView.centerXAnchor),
			hoursLable.centerYAnchor.constraint(equalTo: hoursView.centerYAnchor),
			minutesLable.centerXAnchor.constraint(equalTo: minutesView.centerXAnchor),
			minutesLable.centerYAnchor.constraint(equalTo: minutesView.centerYAnchor),
			secondsLable.centerXAnchor.constraint(equalTo: secondsView.centerXAnchor),
			secondsLable.centerYAnchor.constraint(equalTo: secondsView.centerYAnchor),
			firstColon.leadingAnchor.constraint(equalTo: dayView.trailingAnchor, constant: Constants.share.timerColonSpaceWidth),
			firstColon.widthAnchor.constraint(equalToConstant: Constants.share.timerColonSpaceWidth),
			hoursView.leadingAnchor.constraint(equalTo: firstColon.trailingAnchor, constant: Constants.share.timerColonSpaceWidth),
			secondColon.leadingAnchor.constraint(equalTo: hoursView.trailingAnchor, constant: Constants.share.timerColonSpaceWidth),
			secondColon.widthAnchor.constraint(equalToConstant: Constants.share.timerColonSpaceWidth),
			minutesView.leadingAnchor.constraint(equalTo: secondColon.trailingAnchor, constant: Constants.share.timerColonSpaceWidth),
			thirdColon.leadingAnchor.constraint(equalTo: minutesView.trailingAnchor, constant: Constants.share.timerColonSpaceWidth),
			secondsView.leadingAnchor.constraint(equalTo: thirdColon.trailingAnchor, constant: Constants.share.timerColonSpaceWidth),
		])
		
		regularConstraints.append(contentsOf: [
			dayView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPad),
			dayView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPad),
			firstColon.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPad),
			hoursView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPad),
			hoursView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPad),
			secondColon.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPad),
			
			minutesView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPad),
			minutesView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPad),
			thirdColon.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPad),
			secondsView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPad),
			secondsView.widthAnchor.constraint(equalToConstant: Constants.share.timerWidthIPad)
		])
		
		compactConstraints.append(contentsOf: [
			dayView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
			firstColon.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
			hoursView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
			secondColon.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
			
			minutesView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
			thirdColon.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
			secondsView.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
		])
	}
	
	private func layoutTrait(traitCollection:UITraitCollection) {
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
			setFontsForIpad()
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	private func setFontsForIpad() {
		dayLable.font = .systemFont(ofSize: 20, weight: .bold)
		hoursLable.font = .systemFont(ofSize: 20, weight: .bold)
		minutesLable.font = .systemFont(ofSize: 20, weight: .bold)
		secondsLable.font = .systemFont(ofSize: 20, weight: .bold)
		firstColon.font = .systemFont(ofSize: 20, weight: .bold)
		secondColon.font = .systemFont(ofSize: 20, weight: .bold)
		thirdColon.font = .systemFont(ofSize: 20, weight: .bold)
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		layoutTrait(traitCollection: traitCollection)
	}
	
}

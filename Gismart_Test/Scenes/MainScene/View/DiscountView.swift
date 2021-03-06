//
//  DiscountViewController.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 29.06.22.
//

import UIKit

protocol DiscountViewProtocol: UIViewController {
	func showPopupScreen()
}

class DiscountView: UIViewController, DiscountViewProtocol {

	var presenter: DiscountPresenterProtocol?
	let timer = TimerView()

	lazy private var musicImage: UIImageView = {
		let image =	UIImage(named: "music")!
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	lazy private var offerTitleLable: UILabel = {
		var lable = UILabel()
		lable.text = "LAST-MINUTE CHANCE! to claim your offer"
		lable.textColor = .white
		lable.font = .systemFont(ofSize: 22, weight: .semibold)
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.textAlignment = .center
		lable.lineBreakStrategy = .standard
		lable.lineBreakMode = .byTruncatingHead
		lable.numberOfLines = 2
		return lable
	}()

	lazy private var offerPercentLable: UILabel = {
		var lable = UILabel()
		lable.text = "90% OFF"
		lable.textColor = .white
		lable.font = .systemFont(ofSize: 55, weight: .black)
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.textAlignment = .center
		lable.numberOfLines = 1
		return lable
	}()

	lazy private var forLable: UILabel = {
		var lable = UILabel()
		lable.text = "For true music fans"
		lable.textColor = .white
		lable.font = .systemFont(ofSize: 15, weight: .semibold)
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.textAlignment = .center
		lable.numberOfLines = 1
		return lable
	}()

	lazy private var numberOfSongsLable: UILabel = {
		var lable = UILabel()
		lable.text = "Hundreds of songs in your pocket"
		lable.textColor = .white
		lable.font = .systemFont(ofSize: 14, weight: .regular)
		lable.translatesAutoresizingMaskIntoConstraints = false
		lable.textAlignment = .center
		lable.numberOfLines = 1
		return lable
	}()

	lazy private var activationButton: UIButton = {
		var button = GradientButton()
		button.setTitle("ACTIVATE OFFER", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
		button.addTarget(self, action: #selector(showPopupScreen), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 12
		button.layer.shadowColor = UIColor.systemPurple.cgColor
		button.layer.shadowRadius = 20
		button.layer.shadowOpacity = 0.9
		button.layer.masksToBounds = false
		return button
	}()

	lazy private var XButton: UIButton = {
		var button = UIButton()
		button.setImage(UIImage(systemName: "xmark"), for: .normal)
		button.imageView?.tintColor = .darkGray
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	lazy private var privacyButton = createButtomButtons(text: "Privacy")
	lazy private var restoreButton = createButtomButtons(text: "Restore")
	lazy private var termsButton = createButtomButtons(text: "Terms")

	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []
	private var sharedConstraints: [NSLayoutConstraint] = []

	private func createButtomButtons(text: String) -> UIButton {
		let button = UIButton()
		button.setTitle(text, for: .normal)
		button.setTitleColor(.gray, for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}

	private func setFonts() {
		offerTitleLable.font = .systemFont(ofSize: 35, weight: .semibold)
		offerPercentLable.font = .systemFont(ofSize: 80, weight: .black)
		forLable.font = .systemFont(ofSize: 20, weight: .semibold)
		numberOfSongsLable.font = .systemFont(ofSize: 18, weight: .regular)
		activationButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
		privacyButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
		restoreButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
		termsButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
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
		}
		else {
			if compactConstraints.count > 0 && compactConstraints[0].isActive {
				NSLayoutConstraint.deactivate(compactConstraints)
			}
			setFonts()
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	private func setupConstraints() {
		switch UIDevice.current.name {
		case Devices.iPadPro5thGen.rawValue:
			regularConstraints.append(contentsOf: [
				offerTitleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
				])
		case Devices.iPhoneSE1.rawValue:
			compactConstraints.append(contentsOf: [
				offerTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
				offerPercentLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
				offerPercentLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),
				forLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
				forLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),
				timer.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
				numberOfSongsLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
				numberOfSongsLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),

				offerTitleLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor, constant: 10),
				offerTitleLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor, constant: -10),

				offerPercentLable.topAnchor.constraint(equalTo: offerTitleLable.bottomAnchor, constant: 10),

				forLable.topAnchor.constraint(equalTo: offerPercentLable.bottomAnchor, constant: 6),

				timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 10),
				timer.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),

				numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 10),

				activationButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
				activationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
				activationButton.heightAnchor.constraint(equalToConstant: Constants.share.activationButtonHeightIPhoneSE1),
				activationButton.widthAnchor.constraint(equalToConstant: Constants.share.activationButtonWidthIPhoneSE1),

				privacyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
				privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),

				restoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
				restoreButton.centerXAnchor.constraint(equalTo: activationButton.centerXAnchor),

				termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
				termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
			])
		default:

			regularConstraints.append(contentsOf: [
				offerTitleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
				])

			compactConstraints.append(contentsOf: [
				offerTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
				offerPercentLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
				offerPercentLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),
				forLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
				forLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),
				timer.heightAnchor.constraint(equalToConstant: Constants.share.timerHeightIPhone),
				numberOfSongsLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
				numberOfSongsLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),

				offerTitleLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor, constant: 20),
				offerTitleLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor, constant: -20),

				offerPercentLable.topAnchor.constraint(equalTo: offerTitleLable.bottomAnchor, constant: 12),

				forLable.topAnchor.constraint(equalTo: offerPercentLable.bottomAnchor, constant: 8),

				timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
				timer.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),

				numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),

				activationButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
				activationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
				activationButton.heightAnchor.constraint(equalToConstant: Constants.share.activationButtonHeightIPhone),
				activationButton.widthAnchor.constraint(equalToConstant: Constants.share.activationButtonWidthIPhone),

				privacyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
				privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),

				restoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
				restoreButton.centerXAnchor.constraint(equalTo: activationButton.centerXAnchor),

				termsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
				termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
			])
		}

		sharedConstraints.append(contentsOf: [

			XButton.topAnchor.constraint(equalTo: view.topAnchor),
			XButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			XButton.widthAnchor.constraint(equalToConstant: 50),
			XButton.heightAnchor.constraint(equalToConstant: 50),

			musicImage.topAnchor.constraint(equalTo: XButton.bottomAnchor),
			musicImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			musicImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			musicImage.trailingAnchor.constraint(equalTo: view.centerXAnchor),
		])

		regularConstraints.append(contentsOf: [
			offerTitleLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
			offerTitleLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),

			offerPercentLable.topAnchor.constraint(equalTo: offerTitleLable.bottomAnchor, constant: 12),
			offerPercentLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
			offerPercentLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),

			forLable.topAnchor.constraint(equalTo: offerPercentLable.bottomAnchor, constant: 8),
			forLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
			forLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),

			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
			timer.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
			timer.heightAnchor.constraint(equalToConstant: 57),

			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),
			numberOfSongsLable.leadingAnchor.constraint(equalTo: activationButton.leadingAnchor),
			numberOfSongsLable.trailingAnchor.constraint(equalTo: activationButton.trailingAnchor),

			activationButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 30),
			activationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -95),
			activationButton.heightAnchor.constraint(equalToConstant: Constants.share.activationButtonHeightIPad),
			activationButton.widthAnchor.constraint(equalToConstant: Constants.share.activationButtonWidthIPad),

			privacyButton.topAnchor.constraint(equalTo: activationButton.bottomAnchor, constant: 20),
			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),

			restoreButton.topAnchor.constraint(equalTo: activationButton.bottomAnchor, constant: 20),
			restoreButton.centerXAnchor.constraint(equalTo: activationButton.centerXAnchor),

			termsButton.topAnchor.constraint(equalTo: activationButton.bottomAnchor, constant: 20),
			termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
		])
	}

	@objc func showPopupScreen() {
		presenter?.showActivationTime()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		timer.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .black

		view.addSubview(musicImage)
		view.addSubview(offerTitleLable)
		view.addSubview(offerPercentLable)
		view.addSubview(forLable)
		view.addSubview(numberOfSongsLable)
		view.addSubview(activationButton)
		view.addSubview(privacyButton)
		view.addSubview(restoreButton)
		view.addSubview(termsButton)
		view.addSubview(XButton)
		view.addSubview(timer)

		setupConstraints()
		NSLayoutConstraint.activate(sharedConstraints)
		layoutTrait(traitCollection: UIScreen.main.traitCollection)
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		layoutTrait(traitCollection: traitCollection)
	}
}

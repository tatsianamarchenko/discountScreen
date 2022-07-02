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

	lazy private var saleTitleLable: UILabel = {
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

	lazy private var salePercentLable: UILabel = {
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

	lazy private var activateButton: UIButton = {
		var button = ActualGradientButton()
		button.setTitle("ACTIVATE OFFER", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
		button.addTarget(self, action: #selector(showPopupScreen), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 12
		button.layer.shadowColor = UIColor.systemPink.cgColor
		button.layer.shadowRadius = 30
		button.layer.shadowOpacity = 0.8
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
		saleTitleLable.font = .systemFont(ofSize: 35, weight: .semibold)
		salePercentLable.font = .systemFont(ofSize: 80, weight: .black)
		forLable.font = .systemFont(ofSize: 20, weight: .semibold)
		numberOfSongsLable.font = .systemFont(ofSize: 18, weight: .regular)
		activateButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
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
		case Devices.iPhoneSE1.rawValue:
			compactConstraints.append(contentsOf: [
				saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
				salePercentLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
				salePercentLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
				forLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
				forLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
				timer.heightAnchor.constraint(equalToConstant: 41),
				numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
				numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),

				saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 20),
				saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

				salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 10),

				forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 6),

				timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 10),
				timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),

				numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 10),

				activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
				activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
				activateButton.heightAnchor.constraint(equalToConstant: 50),
				activateButton.widthAnchor.constraint(equalToConstant: 280),

				privacyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
				privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),

				restoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
				restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),

				termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
				termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
			])
		default:
			compactConstraints.append(contentsOf: [
				saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
				salePercentLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
				salePercentLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
				forLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
				forLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
				timer.heightAnchor.constraint(equalToConstant: 41),
				numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
				numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),

				saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 30),
				saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),

				salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 12),

				forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 8),

				timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
				timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 10),

				numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),

				activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
				activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
				activateButton.heightAnchor.constraint(equalToConstant: 63),
				activateButton.widthAnchor.constraint(equalToConstant: 300),

				privacyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
				privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),

				restoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
				restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),

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
			saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
			saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
			saleTitleLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),

			salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 12),
			salePercentLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
			salePercentLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),

			forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 8),
			forLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
			forLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),

			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
			timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
			timer.heightAnchor.constraint(equalToConstant: 60),

			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),
			numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
			numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),

			activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 30),
			activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -95),
			activateButton.heightAnchor.constraint(equalToConstant: 88),
			activateButton.widthAnchor.constraint(equalToConstant: 403),

			privacyButton.topAnchor.constraint(equalTo: activateButton.bottomAnchor, constant: 20),
			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),

			restoreButton.topAnchor.constraint(equalTo: activateButton.bottomAnchor, constant: 20),
			restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),

			termsButton.topAnchor.constraint(equalTo: activateButton.bottomAnchor, constant: 20),
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
		view.addSubview(saleTitleLable)
		view.addSubview(salePercentLable)
		view.addSubview(forLable)
		view.addSubview(numberOfSongsLable)
		view.addSubview(activateButton)
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

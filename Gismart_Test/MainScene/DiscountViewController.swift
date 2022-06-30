//
//  ViewController.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 29.06.22.
//

import UIKit

class ViewController: UIViewController {

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
		lable.backgroundColor = .systemMint
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
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 12

		button.layer.shadowColor = UIColor.systemPink.cgColor
		button.layer.shadowRadius = 30
		button.layer.shadowOpacity = 0.8
		button.layer.masksToBounds = false

		return button
	}()

	lazy private var privacyButton = createButtomButtons(text: "Privacy")
	lazy private var restoreButton = createButtomButtons(text: "Restore")
	lazy private var termsButton = createButtomButtons(text: "Terms")

	private func createButtomButtons(text: String) -> UIButton {
		let button = UIButton()
		button.setTitle(text, for: .normal)
		button.setTitleColor(.gray, for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}

	let customAlert = OfferActivatedView()

	@objc func presentVC() {
		timer.dateToTransfer { houseLeft, minutesLeft, secondsLeft in
			self.customAlert.showAlert(with: "Great!", message: "Offer activated: \(houseLeft)\(minutesLeft)\(secondsLeft)", onView: self)
		}
	}

	@objc func tapped() {
		customAlert.dismissAlert()
	}


	override func viewDidLoad() {
		super.viewDidLoad()
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
			customAlert.backgroundView.addGestureRecognizer(tapGesture)
		view.addSubview(musicImage)
		view.addSubview(saleTitleLable)
		view.addSubview(salePercentLable)
		view.addSubview(forLable)
		view.addSubview(numberOfSongsLable)
		view.addSubview(activateButton)
		view.addSubview(privacyButton)
		view.addSubview(restoreButton)
		view.addSubview(termsButton)
		timer.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(timer)
		makeConstraints()
		view.backgroundColor = .black
		activateButton.addTarget(self, action: #selector(presentVC), for: .touchUpInside)
	}
	var timer = TimerView()

	func makeConstraints() {
		NSLayoutConstraint.activate([
			musicImage.topAnchor.constraint(equalTo: view.topAnchor),
			musicImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			musicImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			musicImage.trailingAnchor.constraint(equalTo: view.centerXAnchor)
		])

		NSLayoutConstraint.activate([
			saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
			saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 30),
		//	saleTitleLable.widthAnchor.constraint(equalToConstant: 260),
			saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
		])

		NSLayoutConstraint.activate([
			salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 12),
			salePercentLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
			salePercentLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor)
		])

		NSLayoutConstraint.activate([
			forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 8),
			forLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
			forLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor)
		])

		NSLayoutConstraint.activate([
			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 16),
			timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 10)
		])

		NSLayoutConstraint.activate([
			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 56),
			numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
			numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor)
		])

		NSLayoutConstraint.activate([
			activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
			activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			activateButton.heightAnchor.constraint(equalToConstant: 63),
			activateButton.widthAnchor.constraint(equalToConstant: 300)
		])

		NSLayoutConstraint.activate([
			privacyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),
		])

		NSLayoutConstraint.activate([
			restoreButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
			restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
		])

		NSLayoutConstraint.activate([
			termsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
			termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10),
		])
	}
	
}

class ActualGradientButton: UIButton {

	override func layoutSubviews() {
		super.layoutSubviews()
		gradientLayer.frame = bounds
	}

	private lazy var gradientLayer: CAGradientLayer = {
		let l = CAGradientLayer()
		l.frame = self.bounds
		let blue = #colorLiteral(red: 0.2575358152, green: 0.2706360817, blue: 0.6008356214, alpha: 1).cgColor
		let pink = #colorLiteral(red: 0.987001121, green: 0.2012993395, blue: 0.7515467405, alpha: 1).cgColor
		l.colors = [blue, pink]
		l.type = .axial
		l.startPoint = CGPoint(x: 0, y: 0.5)
		l.endPoint = CGPoint(x: 1, y: 0.5)
		l.cornerRadius = 16
		layer.insertSublayer(l, at: 0)
		return l
	}()
}

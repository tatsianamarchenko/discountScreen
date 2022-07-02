//
//  other.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 2.07.22.
//

import Foundation

//	func makeConstraints() {
//
//		NSLayoutConstraint.activate([
//			XButton.topAnchor.constraint(equalTo: view.topAnchor),
//			XButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//			XButton.widthAnchor.constraint(equalToConstant: 50),
//			XButton.heightAnchor.constraint(equalToConstant: 50)
//		])
//
//		NSLayoutConstraint.activate([
//			musicImage.topAnchor.constraint(equalTo: XButton.bottomAnchor),
//			musicImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//			musicImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//			musicImage.trailingAnchor.constraint(equalTo: view.centerXAnchor)
//		])
//
//		NSLayoutConstraint.activate([
//			saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
//			saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 30),
//			saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
//		])
//
//		NSLayoutConstraint.activate([
//			salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 12),
//			salePercentLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
//			salePercentLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor)
//		])
//
//		NSLayoutConstraint.activate([
//			forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 8),
//			forLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
//			forLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor)
//		])
//
//		NSLayoutConstraint.activate([
//			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
//			timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 10),
//			timer.heightAnchor.constraint(equalToConstant: 41)
//		])
//
//		NSLayoutConstraint.activate([
//			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),
//			numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//			numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor)
//		])
//
//		NSLayoutConstraint.activate([
//			activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
//			activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20), //
//			activateButton.heightAnchor.constraint(equalToConstant: 63),
//			activateButton.widthAnchor.constraint(equalToConstant: 300)
//		])
//
//		NSLayoutConstraint.activate([
//			privacyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),
//		])
//
//		NSLayoutConstraint.activate([
//			restoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//			restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
//		])
//
//		NSLayoutConstraint.activate([
//			termsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//			termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10),
//		])
//	}


//{
//	print(UIDevice.current.name)
//	switch UIDevice.current.name {
//	case Devices.iPhoneSE1.rawValue, Devices.iPhoneSE3.rawValue:
//		compactConstraints.append(contentsOf: [
//			saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 20),
//			saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//
//			salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 10),
//
//			forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 6),
//
//			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 10),
//			timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//
//			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 10),
//
//			activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
//			activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10), //
//			activateButton.heightAnchor.constraint(equalToConstant: 50),
//			activateButton.widthAnchor.constraint(equalToConstant: 280),
//
//			privacyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),
//
//			restoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//			restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
//
//			termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//			termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
//		])
//	default:
//		compactConstraints.append(contentsOf: [
//
//			saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 30),
//			saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//
//
//			salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 12),
//
//			forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 8),
//
//			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
//			timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 10),
//
//			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),
//
//			activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
//			activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20), //
//			activateButton.heightAnchor.constraint(equalToConstant: 63),
//			activateButton.widthAnchor.constraint(equalToConstant: 300),
//
//			privacyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),
//
//			restoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//			restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
//
//			termsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//			termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
//		])
//
//	}
//
//	sharedConstraints.append(contentsOf: [
//		viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//		viewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
//		viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//		viewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
//
//		XButton.topAnchor.constraint(equalTo: view.topAnchor),
//		XButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//		XButton.widthAnchor.constraint(equalToConstant: 50),
//		XButton.heightAnchor.constraint(equalToConstant: 50),
//
//		musicImage.topAnchor.constraint(equalTo: XButton.bottomAnchor),
//		musicImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//		musicImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//		musicImage.trailingAnchor.constraint(equalTo: view.centerXAnchor),
//
//		saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
//		//			saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 30),
//		//			saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//		//
//		//			salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 12),
//		salePercentLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
//		salePercentLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
//		//
//		//			forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 8),
//		forLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
//		forLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
//		//
//		//			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
//		//			timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 10),
//		timer.heightAnchor.constraint(equalToConstant: 41),
//		//
//		//			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),
//		numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//		numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),
//		//
//		//			activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
//		//			activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20), //
//		//			activateButton.heightAnchor.constraint(equalToConstant: 63),
//		//			activateButton.widthAnchor.constraint(equalToConstant: 300),
//
//		//			privacyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//		//			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),
//		//
//		//			restoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//		//			restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
//		//
//		//			termsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
//		//			termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
//	])
//
//	regularConstraints.append(contentsOf: [
//		saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//		saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//		saleTitleLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),
//
//		salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 12),
//		salePercentLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//		salePercentLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),
//
//		forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 8),
//		forLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//		forLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),
//
//		timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 20),
//		timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//		timer.heightAnchor.constraint(equalToConstant: 60),
//
//		numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 16),
//		numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//		numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),
//
//		activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 30),
//		activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -95),
//		activateButton.heightAnchor.constraint(equalToConstant: 88),
//		activateButton.widthAnchor.constraint(equalToConstant: 403),
//
//		privacyButton.topAnchor.constraint(equalTo: activateButton.bottomAnchor, constant: 20),
//		privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),
//
//		restoreButton.topAnchor.constraint(equalTo: activateButton.bottomAnchor, constant: 20),
//		restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
//
//		termsButton.topAnchor.constraint(equalTo: activateButton.bottomAnchor, constant: 20),
//		termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
//	])
//
//	//		compactConstraints.append(contentsOf: [
//	//			saleTitleLable.topAnchor.constraint(equalTo: view.topAnchor),
//	//			saleTitleLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor, constant: 20),
//	//			saleTitleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//
//	//			salePercentLable.topAnchor.constraint(equalTo: saleTitleLable.bottomAnchor, constant: 10),
//	//			salePercentLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
//	//			salePercentLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
//
//	//			forLable.topAnchor.constraint(equalTo: salePercentLable.bottomAnchor, constant: 6),
//	//			forLable.leadingAnchor.constraint(equalTo: saleTitleLable.leadingAnchor),
//	//			forLable.trailingAnchor.constraint(equalTo: saleTitleLable.trailingAnchor),
//
//	//			timer.topAnchor.constraint(equalTo: forLable.bottomAnchor, constant: 10),
//	//			timer.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//	//			timer.heightAnchor.constraint(equalToConstant: 41),
//
//	//			numberOfSongsLable.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 10),
//	//			numberOfSongsLable.leadingAnchor.constraint(equalTo: activateButton.leadingAnchor),
//	//			numberOfSongsLable.trailingAnchor.constraint(equalTo: activateButton.trailingAnchor),
//
//	//			activateButton.topAnchor.constraint(equalTo: numberOfSongsLable.bottomAnchor, constant: 10),
//	//			activateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10), //
//	//			activateButton.heightAnchor.constraint(equalToConstant: 50),
//	//			activateButton.widthAnchor.constraint(equalToConstant: 280),
//	//
//	//			privacyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//	//			privacyButton.trailingAnchor.constraint(equalTo: restoreButton.leadingAnchor, constant: -10),
//	//
//	//			restoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//	//			restoreButton.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
//	//
//	//			termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//	//			termsButton.leadingAnchor.constraint(equalTo: restoreButton.trailingAnchor, constant: 10)
//	//		])
//}

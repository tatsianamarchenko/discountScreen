//
//  TimerManager.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 30.06.22.
//

import Foundation
import UIKit

class TimerManager {

	private var timer: Timer?
	private var timerValue: Int

	var dayLable: UILabel?
	var hoursLable: UILabel?
	var minutesLable: UILabel?
	var secondsLable: UILabel?

	init(timerValue: Int, dayLable: UILabel, hoursLable: UILabel, minutesLable: UILabel, secondsLable: UILabel) {
		self.timerValue = timerValue
		self.dayLable = dayLable
		self.hoursLable = hoursLable
		self.minutesLable = minutesLable
		self.secondsLable = secondsLable
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

				if self?.dayLable?.text != days{
					self?.dayLable?.wheelAnimation()
				}
				if self?.hoursLable?.text != hours{
					self?.hoursLable?.wheelAnimation()
				}
				if self?.minutesLable?.text != minutes{
					self?.minutesLable?.wheelAnimation()
				}
				if self?.secondsLable?.text != seconds{
					self?.secondsLable?.wheelAnimation()
				}

				self?.dayLable?.text = days
				self?.hoursLable?.text = hours
				self?.minutesLable?.text = minutes
				self?.secondsLable?.text = seconds
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
}

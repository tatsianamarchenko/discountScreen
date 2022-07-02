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
	private var timerView: TimerView

	init(timerValue: Int, timerView: TimerView) {
		self.timerValue = timerValue
		self.timerView = timerView
		self.runTimer()
	}

	func dateToTransfer(complition: @escaping(String, String, String, String) -> Void) {
		timeString(time: TimeInterval(timerValue)) { (days, hours, minutes, seconds) in
			var daysLeft = "\(days):"
			var houseLeft = "\(hours):"
			var minutesLeft = "\(minutes):"

			if daysLeft == "00:" {
				daysLeft = ""
			}
			if houseLeft == "00:" {
				houseLeft = ""
			}
			if minutesLeft == "00:" {
				minutesLeft = ""
			}
			complition(daysLeft, houseLeft, minutesLeft, seconds)
		}
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

				if self?.timerView.dayLable?.text != days{
					self?.timerView.dayLable?.wheelAnimation()
				}
				if self?.timerView.hoursLable?.text != hours{
					self?.timerView.hoursLable?.wheelAnimation()
				}
				if self?.timerView.minutesLable?.text != minutes{
					self?.timerView.minutesLable?.wheelAnimation()
				}
				if self?.timerView.secondsLable?.text != seconds{
					self?.timerView.secondsLable?.wheelAnimation()
				}

				self?.timerView.dayLable?.text = days
				self?.timerView.hoursLable?.text = hours
				self?.timerView.minutesLable?.text = minutes
				self?.timerView.secondsLable?.text = seconds
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

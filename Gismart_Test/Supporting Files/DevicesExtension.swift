//
//  DevicesExtension.swift
//  Gismart_Test
//
//  Created by Tatsiana Marchanka on 2.07.22.
//

import Foundation
import UIKit

public enum Devices: String {
	case iPhoneSE1 = "iphone se 1"
	case iPhoneSE3 = "iPhone SE (3rd generation)"
	case iPhone12mini =  "iPhone 12 mini"
	case IPhone6
	case IPhone6Plus
	case IPhone6S
	case IPhone6SPlus
	case IPhone7
	case IPhone7Plus
	case IPhoneSE
	case IPhone8
	case IPhone8Plus
	case IPhoneX
	case Other
}

//public extension UIDevice {
//
//	var modelName: String {
//		var systemInfo = utsname()
//		uname(&systemInfo)
//		let machineMirror = Mirror(reflecting: systemInfo.machine)
//		let identifier = machineMirror.children.reduce("") { identifier, element in
//			guard let value = element.value as? Int8 , value != 0 else { return identifier }
//			return identifier + String(UnicodeScalar(UInt8(value)))
//		}
//
//		switch identifier {
//		case "iphone se 1":                  return Devices.iPhoneSE1.rawValue
//		case "iPhone 12 mini":                  return Devices.iPhone12mini.rawValue
//		case "iPhone SE (3rd generation)":                  return Devices.iPhoneSE3.rawValue
//		case "iPhone7,2":                               return Devices.IPhone6.rawValue
//		case "iPhone7,1":                               return Devices.IPhone6Plus.rawValue
//		case "iPhone8,1":                               return Devices.IPhone6S.rawValue
//		case "iPhone8,2":                               return Devices.IPhone6SPlus.rawValue
//		case "iPhone9,1", "iPhone9,3":                  return Devices.IPhone7.rawValue
//		case "iPhone9,2", "iPhone9,4":                  return Devices.IPhone7Plus.rawValue
//		case "iPhone8,4":                               return Devices.IPhoneSE.rawValue
//		case "iPhone10,1", "iPhone10,4":                return Devices.IPhone8.rawValue
//		case "iPhone10,2", "iPhone10,5":                return Devices.IPhone8Plus.rawValue
//		case "iPhone10,3", "iPhone10,6":                return Devices.IPhoneX.rawValue
//		default:                                        return Devices.Other.rawValue
//		}
//	}
//}

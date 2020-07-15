//
//  Level.swift
//  Imagine This
//
//  Created by Aleksey on 0715..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

enum Level: String, CaseIterable {
	case easy
	case normal
	case hard
	
	var image: UIImage? {
		return UIImage(named: self.rawValue)
	}
	
	var selectedImage: UIImage? {
		return UIImage(named: "\(self.rawValue)_selected")
	}
}

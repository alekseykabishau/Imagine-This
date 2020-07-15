//
//  Category.swift
//  Imagine This
//
//  Created by Aleksey on 0715..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

enum Category: String, CaseIterable {
	case horror
	case urban
	
	var image: UIImage? {
		return UIImage(named: self.rawValue)
	}
}

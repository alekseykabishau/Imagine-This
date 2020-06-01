//
//  Sentence.swift
//  Imagine This
//
//  Created by Aleksey on 0517..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import Foundation


enum Level: String, CaseIterable {
	case easy
	case moderate
	case difficult
}


enum Category: Int {
	case horror
	case urban
	
	var title: String {
		switch self {
			case .horror: return "HORROR"
			case .urban: return "URBAN"
		}
	}
}

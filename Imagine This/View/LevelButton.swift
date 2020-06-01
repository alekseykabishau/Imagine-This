//
//  LevelButton.swift
//  Imagine This
//
//  Created by Aleksey on 0525..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class LevelButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	convenience init(level: Level) {
		self.init(frame: .zero)
		self.setTitle(level.rawValue, for: .normal)
	}
	
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius = 10
		layer.borderWidth = 2
		layer.borderColor = UIColor.white.cgColor
		setTitleColor(.white, for: .normal)
		titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		isSelected = false
	}
	
	
	override var isSelected: Bool {
		didSet {
			backgroundColor = isSelected ? .systemPink : .clear
		}
	}
}

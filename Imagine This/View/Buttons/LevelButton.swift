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
		setImage(level.image, for: .normal)
		setImage(level.selectedImage, for: .selected)
	}
	
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		imageView?.contentMode = .scaleAspectFit
		isSelected = false
	}
}

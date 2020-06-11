//
//  StartButton.swift
//  Imagine This
//
//  Created by Aleksey on 0609..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class StartButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		setImage(UIImage(named: "start"), for: .normal)
	}
}

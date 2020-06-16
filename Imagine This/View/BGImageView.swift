//
//  BGImageView.swift
//  Imagine This
//
//  Created by Aleksey on 0615..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class BGImageView: UIImageView {
	
	let backgroundImage = UIImage(named: "background")
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		contentMode = .scaleAspectFill
		image = backgroundImage
	}

}

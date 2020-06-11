//
//  CategoryCell.swift
//  Imagine This
//
//  Created by Aleksey on 0607..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
	
	static let reuseIdentifier = String(describing: CategoryCell.self)
	let imageView = UIImageView(frame: .zero)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func configure() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		contentView.addSubview(imageView)
		let inset: CGFloat = 10
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
		])
	}
}

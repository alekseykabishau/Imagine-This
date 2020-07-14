//
//  CardView.swift
//  Imagine This
//
//  Created by Aleksey on 0601..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class CardView: UIView {
	
	let backgroundImageView = UIImageView()
	let sentenceLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		//configure()
		configureImageView()
		configureSentenceLabel()
		addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
	}
	
	convenience init(rotationAngle: CGFloat) {
		self.init()
		self.transform = CGAffineTransform(rotationAngle: rotationAngle)
	}
	
	
	@objc private func handlePan(gesture: UIPanGestureRecognizer) {
		
		switch gesture.state {
			case .changed:
				handleChanged(gesture)
			case .ended:
				handleEnd(gesture)
			default: ()
		}
	}
	
	
	private func handleChanged(_ gesture: UIPanGestureRecognizer) {
		let translation = gesture.translation(in: self)
		self.transform = CGAffineTransform(translationX: translation.x, y: 0)
	}
	
	
	private func handleEnd(_ gesture: UIPanGestureRecognizer) {
		let threshold: CGFloat = self.frame.width / 3
		let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
		let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
		
		UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
			if shouldDismissCard {
				self.transform = self.transform.translatedBy(x: 600 * translationDirection, y: 0)
			} else {
				self.transform = .identity
			}
		}) { (_) in
			if shouldDismissCard {
				self.removeFromSuperview()
			}
		}
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
//	private func configure() {
//		//translatesAutoresizingMaskIntoConstraints = false
//
//		//layer.cornerRadius = 15
//		//clipsToBounds = true
//		//backgroundColor = .systemPink
//		//layer.borderWidth = 1
//		//layer.border.color
//
//
//	}
	

	private func configureImageView() {
		backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(backgroundImageView)
		backgroundImageView.fillSuperview()
		backgroundImageView.image = UIImage(named: "card")
		backgroundImageView.clipsToBounds = true
	}
	
	private func configureSentenceLabel() {
		sentenceLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(sentenceLabel)
		sentenceLabel.centerInSuperview(size: CGSize(width: 250, height: 100))
		sentenceLabel.numberOfLines = 0
		sentenceLabel.textAlignment = .center
		//sentenceLabel.backgroundColor = .systemTeal
	}
}

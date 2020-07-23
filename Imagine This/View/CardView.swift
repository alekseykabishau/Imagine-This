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
		//TODO: - how keep rotation angle during pan gesture?; now it removes rotation and that why transform.identity doesn't work if card is not being dismissed
		self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
	}
	
	
	//TODO: - Refactor
	private func handleEnd(_ gesture: UIPanGestureRecognizer) {
		let threshold: CGFloat = self.frame.width / 3
		//TODO: - make it multidirectional; make it propotional, so card removal follows the pan gesture direction;
		// test case - vertical drag
		let horizontalTranslationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
		let verticalTranslationDirection: CGFloat = gesture.translation(in: nil).y > 0 ? 1 : -1
		
		var shouldDismissCard: Bool {
			if abs(gesture.translation(in: nil).x) > threshold {
				return true
			} else if abs(gesture.translation(in: nil).y) > threshold {
				return true
			}
			return false
		}
		
		UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
			if shouldDismissCard {
				//TODO: - make transformation smother
				self.transform = self.transform.translatedBy(x: 600 * horizontalTranslationDirection, y: 600 * verticalTranslationDirection)
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

//
//  CardsVC.swift
//  Imagine This
//
//  Created by Aleksey on 0516..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class CardsVC: UIViewController {
	
	lazy var backgroundimageView = BGImageView(frame: view.bounds)
	let backButton = BackButton(frame: .zero)
	let grassImageView = UIImageView(image: UIImage(named: "grass"))
	
	
	var sentenceManager: SentenceManager!
		
	
	override func viewDidLoad() {
        super.viewDidLoad()
		layoutUI()
		//title = "\(category.rawValue) + \(level.rawValue)"
		
		generateSentances()
		configureCardsDeckView()
		setupCards()
		
		backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
	}
	
	
	@objc private func backButtonTapped(_ sender: UIButton) {
		if let button = sender as? BackButton {
			button.pulsate()
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			self.dismiss(animated: true)
		}
	}
	
	
	private func layoutUI() {
		
		grassImageView.translatesAutoresizingMaskIntoConstraints = false
		
		
		view.addSubview(backgroundimageView)
		view.addSubview(backButton)
		view.addSubview(grassImageView)
		
		
		NSLayoutConstraint.activate([
			
			backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
			backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			//TODO: - work on size
			backButton.widthAnchor.constraint(equalToConstant: 150),
			backButton.heightAnchor.constraint(equalToConstant: 50),
			
			grassImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			grassImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			grassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			grassImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
		])
	}
	
	
	var sentances = [String]()
	let cardsDeckView = UIView()
	
	private func setupCards() {
		
		sentances.forEach { sentance in
			let randomAngle = CGFloat.random(in: -(CGFloat.pi / 18)...(CGFloat.pi / 18))
			let cardView = CardView(rotationAngle: randomAngle)
			cardView.sentenceLabel.text = sentance
			cardsDeckView.addSubview(cardView)
			cardView.fillSuperview()
		}
	}
	
	
	private func configureCardsDeckView() {
		view.addSubview(cardsDeckView)
		cardsDeckView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			cardsDeckView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			//cardsDeckView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
			cardsDeckView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
			cardsDeckView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
			cardsDeckView.heightAnchor.constraint(equalToConstant: 150)
		])
	}
	
	
	private func generateSentances() {
		sentances = []
		(0..<5).forEach { _ in
			//sentances.append(generateSentance(for: category, level: level))
			sentances.append(sentenceManager.generateSentance(for: sentenceManager.category, level: sentenceManager.level))
		}
	}
	
	
	
}





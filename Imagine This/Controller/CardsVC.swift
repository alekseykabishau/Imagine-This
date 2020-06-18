//
//  CardsVC.swift
//  Imagine This
//
//  Created by Aleksey on 0516..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class CardsVC: UIViewController {
	
	let words = WordsData()
	var category: Category!
	var level: Level!
	
	@IBAction func reloadCardsDeck(_ sender: UIButton) {
		generateSentances()
		setupCards()
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		title = category.rawValue
		generateSentances()
		configureCardsDeckView()
		setupCards()
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
			sentances.append(generateSentance(for: category, level: level))
		}
	}
	
	
	
	func generateSentance(for category: Category, level: Level) -> String {
		switch (level, category) {
			case (.easy, .horror): return generateEasyHorrorSentence()
			case (.easy, .urban): return generateEasyUrbanSentence()
			case (.normal, .horror): return generateHorrorSentence() // the same as difficult
			case (.normal, .urban): return generateUrbanSentence()
			case (.hard, .horror): return generateHorrorSentence()
			case (.hard, .urban): return generateUrbanSentence()
		}
	}
	
	
	func generateEasyUrbanSentence() -> String {
		let noun = words.urbanNouns[Int.random(in: 0..<words.urbanNouns.count)]
		let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
		let place = words.places[Int.random(in: 0..<words.places.count)]
		
		return noun + " " + verb + " " + place
	}
	
	
	func generateEasyHorrorSentence() -> String {
		let noun = words.horrorNouns[Int.random(in: 0..<words.horrorNouns.count)]
		let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
		let place = words.places[Int.random(in: 0..<words.places.count)]
		
		return noun + " " + verb + " " + place
	}
	
	
	func generateUrbanSentence() -> String {
		let adjuective = words.adjectives[Int.random(in: 0..<words.adjectives.count)]
		let noun = words.urbanNouns[Int.random(in: 0..<words.urbanNouns.count)]
		let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
		let noun2 = words.urbanNouns[Int.random(in: 0..<words.urbanNouns.count)]
		let place = words.places[Int.random(in: 0..<words.places.count)]
		
		return adjuective + " " + noun + " " + verb + " " + noun2 + " " + place
	}
	
	
	func generateHorrorSentence() -> String {
		let adjuective = words.adjectives[Int.random(in: 0..<words.adjectives.count)]
		let noun = words.horrorNouns[Int.random(in: 0..<words.horrorNouns.count)]
		let verb = words.verbs[Int.random(in: 0..<words.verbs.count)]
		let noun2 = words.horrorNouns[Int.random(in: 0..<words.horrorNouns.count)]
		let place = words.places[Int.random(in: 0..<words.places.count)]
		
		return adjuective + " " + noun + " " + verb + " " + noun2 + " " + place
	}
}





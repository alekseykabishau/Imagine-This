//
//  GeneratorVC.swift
//  Imagine This
//
//  Created by Aleksey on 0516..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class SentenceVC: UIViewController {
	
	let words = WordsData()
	var category: Category!
	var level: Level!
	
	@IBOutlet weak var generatorLabel: UILabel!
	
	@IBAction func generateButtonTapped(_ sender: UIButton) {
		generateSentance(for: category, level: level)
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		generateSentance(for: category, level: level)
		title = category.title
		
    }
	
	
	func generateSentance(for category: Category, level: Level) {
		switch (level, category) {
			case (.easy, .horror): generatorLabel.text = generateEasyHorrorSentence()
			case (.easy, .urban): generatorLabel.text = generateEasyUrbanSentence()
			case (.difficult, .horror): generatorLabel.text = generateHorrorSentence()
			case (.difficult, .urban): generatorLabel.text = generateUrbanSentence()
			default: break
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





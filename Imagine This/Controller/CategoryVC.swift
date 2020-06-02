//
//  CategoryVC.swift
//  Imagine This
//
//  Created by Aleksey on 0515..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
	
	let easyButton = LevelButton(level: .easy)
	let difficultButton = LevelButton(level: .difficult)
	
	var levelButtons = [UIButton]()
	
	
	@IBAction func categoryButtonTapped(_ sender: UIButton) {		
		performSegue(withIdentifier: "categorySelected", sender: sender.tag)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureLevelButtons()
		view.backgroundColor = .systemTeal
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let sentanceVC = segue.destination as? CardsVC {
			sentanceVC.category = Category.init(rawValue: sender as! Int)
			let selectedButton = levelButtons.filter({ (button) -> Bool in
				button.isSelected
				}).first!
			sentanceVC.level = Level.init(rawValue: selectedButton.currentTitle!)
		}
	}
	
	
	@objc func selectLevel() {
		levelButtons.forEach { $0.isSelected.toggle() }
	}
	
	
	private func configureLevelButtons() {
		
		view.addSubview(easyButton)
		levelButtons.append(easyButton)
		easyButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
		easyButton.isSelected = true // add UserDefaults for selected configuraiton
		
		view.addSubview(difficultButton)
		levelButtons.append(difficultButton)
		difficultButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
		
		
		NSLayoutConstraint.activate([
			easyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			easyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			easyButton.widthAnchor.constraint(equalToConstant: 100),
			easyButton.heightAnchor.constraint(equalToConstant: 40),
			
			difficultButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			difficultButton.leadingAnchor.constraint(equalTo: easyButton.trailingAnchor, constant: 30),
			difficultButton.widthAnchor.constraint(equalToConstant: 100),
			difficultButton.heightAnchor.constraint(equalToConstant: 40)
		])
	}
}

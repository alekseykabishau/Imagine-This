//
//  CategoryVC.swift
//  Imagine This
//
//  Created by Aleksey on 0515..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
	
	enum Section {
		case category
	}
	
	let easyButton = LevelButton(level: .easy)
	let difficultButton = LevelButton(level: .difficult)
	var levelButtons = [UIButton]()
	
	let categories = Category.allCases
	
	
	@IBOutlet weak var collectionView: UICollectionView!
	var dataSource: UICollectionViewDiffableDataSource<Section, Category>!

	
	@IBAction func startButtonTapped(_ sender: UIButton) {
		guard let visibleCategoryIndexPath = collectionView.indexPathsForVisibleItems.first else { print("can't get indexPath"); return }
		let selectedLevelButton = levelButtons.filter { $0.isSelected }.first
		let selectedLevel = selectedLevelButton!.currentTitle!
		print("\(categories[visibleCategoryIndexPath.item]) + \(selectedLevel)")
	}

	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureLevelButtons()
		view.backgroundColor = .systemTeal
		
		collectionView.collectionViewLayout = configureLayout()
		configureDataSource()
	}
	
	
	func configureDataSource() {
		dataSource = UICollectionViewDiffableDataSource<Section, Category>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, category) -> UICollectionViewCell? in
			
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { fatalError("Cannot create new cell") }
			
			cell.categoryLabel.text = category.rawValue
			return cell
		})
		
		var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Category>()
		initialSnapshot.appendSections([.category])
		initialSnapshot.appendItems(categories, toSection: .category)
		dataSource.apply(initialSnapshot, animatingDifferences: false, completion: nil)
	}
	
	
	func configureLayout() -> UICollectionViewCompositionalLayout {
		
		let itemSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .fractionalHeight(1.0))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
		
		let groupSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .fractionalHeight(1.0))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		
		let section = NSCollectionLayoutSection(group: group)
		section.orthogonalScrollingBehavior = .paging
		
		return UICollectionViewCompositionalLayout(section: section)
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

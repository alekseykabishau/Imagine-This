//
//  MainVC.swift
//  Imagine This
//
//  Created by Aleksey on 0609..20.
//  Copyright © 2020 Aleksey Kabishau. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
	
	lazy var imageView = BGImageView(frame: view.bounds)
	let stackView = UIStackView()
	let easyLevelButton = LevelButton(level: .easy)
	let moderateButton = LevelButton(level: .normal)
	let difficultButton = LevelButton(level: .hard)
	let startButton = StartButton(frame: .zero)
	
	enum Section { case main }
	
	let categories = Category.allCases
	var collectionView: UICollectionView!
	var datasource: UICollectionViewDiffableDataSource<Section, Category>!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configureViewController()
		configureStackView()
		configureCollectionView()
		layoutUI()
		addActionToStartButton()
    }
	
	
	func layoutUI() {
		view.addSubview(imageView)
		view.addSubview(stackView)
		view.addSubview(collectionView)
		view.addSubview(startButton)
		
		let padding: CGFloat = 20
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding * 4),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			stackView.heightAnchor.constraint(equalToConstant: 44),
			
			collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
			collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
			
			startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (padding * 3)),
			startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(padding * 3)),
			startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(padding * 2)),
			startButton.heightAnchor.constraint(equalToConstant: 80)
			
		])
	}
	
	
	
	func configureViewController() {
		view.backgroundColor = .systemTeal
	}
	
	private func addActionToStartButton() {
		startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
	}
	
	
	private func configureStackView() {
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		stackView.addArrangedSubview(easyLevelButton)
		stackView.addArrangedSubview(moderateButton)
		stackView.addArrangedSubview(difficultButton)
		
		easyLevelButton.isSelected = true // add user defaults to save user's selection
		easyLevelButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
		moderateButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
		difficultButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
	}
	
	@objc private func selectLevel(sender: UIButton) {
		let buttons = stackView.arrangedSubviews as! [UIButton]
		buttons.forEach { $0.isSelected = false }
		sender.isSelected = true
	}
	
	
	@objc private func startButtonTapped() {
		print(#function)
		guard let visibleCategoryIndexPath = collectionView.indexPathsForVisibleItems.first else { print("can't get indexPath"); return }
		let buttons = stackView.arrangedSubviews as! [UIButton]
		let selectedLevelButton = buttons.filter { $0.isSelected }.first
		let selectedLevel = selectedLevelButton!.currentTitle!
		print("\(categories[visibleCategoryIndexPath.item]) + \(selectedLevel)")
	}
	
	
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		collectionView.backgroundColor = .clear
		collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
		view.addSubview(collectionView)
		
		configureDataSource()
	}
	
	
	private func configureDataSource() {
		datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, category) -> UICollectionViewCell? in
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { fatalError("Cannot create new cell") }
			//cell.label.text = category.rawValue
			cell.imageView.image = UIImage(named: category.rawValue)
			return cell
		})
		
		var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Category>()
		initialSnapshot.appendSections([.main])
		initialSnapshot.appendItems(categories, toSection: .main)
		datasource.apply(initialSnapshot, animatingDifferences: false, completion: nil)
	}
	
	private func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
		
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

}

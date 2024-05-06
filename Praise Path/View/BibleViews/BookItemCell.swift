//
//  BookItemView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/3/24.
//

import Foundation
import UIKit

class BookItemCell: UICollectionViewCell {
	
	//MARK: - Declarations
	
	let designManager = DesignManager()
	
	//books image
	lazy var bookImage: UIImageView = {
		let bookImage = UIImageView()
		bookImage.translatesAutoresizingMaskIntoConstraints = false
		bookImage.contentMode = .scaleAspectFill
		bookImage.image = UIImage(named: "Genesis")
		bookImage.layer.cornerRadius = 10
		bookImage.clipsToBounds = true
		
		return bookImage
	}()
	
	//book title label
	lazy var bookTitle: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = designManager.appFontMedium?.withSize(11)
		label.textColor = designManager.systemWhite
		label.text = "Genesis"
		return label
	}()
	
	//This is the button that goes below the item, which triggers the chapter select
	lazy var chapterButton: UIButton = {
		
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = designManager.grayBlack
		button.layer.cornerRadius = 3
		button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
		button.tintColor = designManager.systemWhite
		return button
	}()
	
	
	//MARK: - Override
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupCell()
		
	}
	
	//MARK: - Setup Functions
	
	func setupCell() {
		//Cell Attributes
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = designManager.grayBlack
		self.layer.cornerRadius = 10
		//bookImage
		self.addSubview(bookImage)
		//bookTitle
		self.addSubview(bookTitle)
		//chapterButton
		self.addSubview(chapterButton)
		
		NSLayoutConstraint.activate([
			//bookImage
			bookImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7),
			bookImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -7),
			bookImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
			bookImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
			//bookTitle
			bookTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			bookTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			bookTitle.topAnchor.constraint(equalTo: bookImage.bottomAnchor),
			//chapterButton
			chapterButton.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
			chapterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			chapterButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
			chapterButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.09),

		
		])
		
	}
	
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
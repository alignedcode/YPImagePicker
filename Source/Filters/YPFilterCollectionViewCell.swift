//
//  YPFilterCollectionViewCell.swift
//  photoTaking
//
//  Created by Sacha Durand Saint Omer on 21/10/16.
//  Copyright © 2016 octopepper. All rights reserved.
//

import Stevia

class YPFilterCollectionViewCell: UICollectionViewCell {
    
    let name = UILabel()
    let imageView = UIImageView()
    let paidView = UIImageView()
    override var isHighlighted: Bool { didSet {
        UIView.animate(withDuration: 0.1) {
            self.contentView.transform = self.isHighlighted
                ? CGAffineTransform(scaleX: 0.95, y: 0.95)
                : CGAffineTransform.identity
        }
        }
    }
    override var isSelected: Bool {
        didSet {
            name.textColor = isSelected
                ? UIColor.ypLabel
                : UIColor.ypSecondaryLabel
            name.font = .systemFont(
                ofSize: 11,
                weight: isSelected ? .semibold : .regular
            )
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sv(
            name,
            imageView,
            paidView
        )
        
        |name|.top(0)
        |imageView|.bottom(0).heightEqualsWidth()
        |paidView|.top(17).right(0).size(20)
        
        name.font = .systemFont(ofSize: 11, weight: UIFont.Weight.regular)
        name.textColor = UIColor.ypSecondaryLabel
        name.textAlignment = .center
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
      
        if #available(iOS 13.0, *) {
            let image = UIImage(systemName: "star.fill")
            paidView.image = image
            paidView.contentMode = .scaleAspectFit
            paidView.tintColor = UIColor(r: 255, g: 199, b: 0)
            paidView.backgroundColor = UIColor(r: 255, g: 239, b: 184)
            paidView.layer.cornerRadius = 2
        } else {
            paidView.backgroundColor = UIColor.yellow
            paidView.layer.cornerRadius = 8
        }
        
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.ypLabel.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 4, height: 7)
        self.layer.shadowRadius = 5
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
}

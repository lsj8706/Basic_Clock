//
//  AlarmCollectionViewCell.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

class AlarmCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlarmCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

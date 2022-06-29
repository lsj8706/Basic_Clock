//
//  SleepAlarmCollectionViewCell.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

class SleepAlarmCollectionViewCell: UICollectionViewCell {
    static let identifier = "SleepAlarmCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  SleepAlarmCollectionViewCell.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

class SleepAlarmCollectionViewCell: UICollectionViewCell {
    static let identifier = "SleepAlarmCollectionViewCell"
    
    private let alarmLabel = UILabel().then {
        $0.text = "알람 없음"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    
    private let cellDivider = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    private let setupButton = UIButton().then {
        let attributedString = NSAttributedString(string: "설정", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .heavy)])
        $0.setAttributedTitle(attributedString, for: .normal)
        $0.setTitleColor(.orange, for: .normal)
        $0.backgroundColor = UIColor(named: "myDarkGray")
        $0.layer.cornerRadius = 15
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(alarmLabel)
        alarmLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(cellDivider)
        cellDivider.snp.makeConstraints { make in
            make.top.equalTo(snp.bottom).inset(1)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        addSubview(setupButton)
        setupButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(30)
            make.width.equalTo(45)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

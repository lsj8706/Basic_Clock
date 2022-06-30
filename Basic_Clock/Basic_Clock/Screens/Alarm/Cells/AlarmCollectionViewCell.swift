//
//  AlarmCollectionViewCell.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

class AlarmCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlarmCollectionViewCell"
    
    private let timeLabel = UILabel().then {
        $0.text = "10:10"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 50, weight: .regular)
    }
    
    private let dayLabel = UILabel().then {
        $0.text = "알람, 월 화 수"
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    private let cellDivider = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    private var alarmSwitch = UISwitch().then {
        $0.setColor(offTint: UIColor(named: "myDarkGray")!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let stack = UIStackView(arrangedSubviews: [timeLabel, dayLabel])
        stack.axis = .vertical
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(cellDivider)
        cellDivider.snp.makeConstraints { make in
            make.top.equalTo(snp.bottom).inset(1)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        addSubview(alarmSwitch)
        alarmSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

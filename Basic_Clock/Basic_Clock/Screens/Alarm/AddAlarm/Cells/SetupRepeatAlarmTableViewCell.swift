//
//  SetupRepeatAlarmTableViewCell.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/05.
//

import UIKit

class SetupRepeatAlarmTableViewCell: UITableViewCell {
    static let identifier = "SetupRepeatAlarmTableViewCell"
    
    //MARK: - UI
    private let settingNameLabel = UILabel().then {
        $0.text = "다시 알림"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    let repeatAlarmSwitch = UISwitch().then {
        $0.setColor(offTint: UIColor(named: "myDarkGray")!)
    }
    
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureUI() {
        addSubview(settingNameLabel)
        settingNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }
        
        addSubview(repeatAlarmSwitch)
        repeatAlarmSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
        }
    }

}

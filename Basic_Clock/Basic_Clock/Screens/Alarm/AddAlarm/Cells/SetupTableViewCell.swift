//
//  setupTableViewCell.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/03.
//

import UIKit

class SetupTableViewCell: UITableViewCell {

    static let identifier = "setupTableViewCell"
    
    //MARK: - UI
    let settingNameLabel = UILabel().then {
        $0.text = "반복"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    let currentSettingValueLabel = UILabel().then {
        $0.text = "안 함"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    
    private let rightChevronImageView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.tintColor = .gray
    }
    
    private let repeatAlarmSwitch = UISwitch().then {
        $0.setColor(offTint: UIColor(named: "myDarkGray")!)
    }
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        addSubview(rightChevronImageView)
        rightChevronImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
        
        addSubview(currentSettingValueLabel)
        currentSettingValueLabel.snp.makeConstraints { make in
            make.trailing.equalTo(rightChevronImageView.snp.leading).offset(-8)
            make.centerY.equalToSuperview()
        }
    }
    
    func setData(settingName: String, settingValueName: String) {
        settingNameLabel.text = settingName
        currentSettingValueLabel.text = settingValueName
    }
    
    func changeCellToReplaceAlarmCell() {
        rightChevronImageView.snp.removeConstraints()
        rightChevronImageView.isHidden = true
        currentSettingValueLabel.snp.removeConstraints()
        currentSettingValueLabel.isHidden = true
        addSubview(repeatAlarmSwitch)
        repeatAlarmSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
        }
    }
}

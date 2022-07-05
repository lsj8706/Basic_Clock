//
//  RepeatDaySelectTableViewCell.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/05.
//

import UIKit

class RepeatDaySelectTableViewCell: UITableViewCell {
    
    static let identifier = "RepeatDaySelectTableViewCell"

    //MARK: - UI
    let settingNameLabel = UILabel().then {
        $0.text = "일요일마다"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        accessoryType = selected ? .checkmark : .none
    }
    
    //MARK: - Helpers
    private func configureUI() {
        addSubview(settingNameLabel)
        settingNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
        }
    }

}

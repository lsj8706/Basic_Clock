//
//  HeaderView.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

class HeaderView: UIView {
    
    //MARK: - UI
    private lazy var editButton = UIButton(type: .system).then {
        $0.setTitle("편집", for: .normal)
        $0.setTitleColor(.orange, for: .normal)
        $0.addTarget(self, action: #selector(editButtonDidTap(sender:)), for: .touchUpInside)
    }

    
    let pageTitleLabel = UILabel().then {
        $0.text = "알람"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    private lazy var addButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .orange
    }
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(pageTitleLabel)
        pageTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        pageTitleLabel.isHidden = true
        
        addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.height.equalTo(32)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    @objc func editButtonDidTap(sender: UIButton) {
        sender.currentTitle == "편집" ? sender.setTitle("완료", for: .normal) : sender.setTitle("편집", for: .normal)
    }
}

//
//  HeaderView.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

class HeaderView: UIView {
    
    //MARK: - UI
    private lazy var editButton = UIButton().then {
        $0.setTitle("편집", for: .normal)
        $0.setTitleColor(.orange, for: .normal)
        $0.addTarget(self, action: #selector(editButtonDidTap(sender:)), for: .touchUpInside)
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
        sender.setTitle("완료", for: .normal)
    }
}

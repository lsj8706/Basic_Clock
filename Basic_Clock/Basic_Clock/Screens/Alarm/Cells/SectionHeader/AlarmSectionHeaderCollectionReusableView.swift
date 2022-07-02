//
//  AlarmSectionHeaderCollectionReusableView.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

enum AlarmSectionHeaderType {
    case sleepAlarm
    case normalAlarm
}

class AlarmSectionHeaderCollectionReusableView: UICollectionReusableView {
    
    //MARK: - Properties
    static let identifier = "AlarmSectionHeaderCollectionReusableView"
    
    var type: AlarmSectionHeaderType = .sleepAlarm {
        didSet {
            configureUI()
        }
    }
    
    let pageNameLabel = UILabel().then {
        $0.text = "알람"
        $0.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        $0.textColor = .white
    }
    
    private let sectionIconImageView = UIImageView().then {
        $0.image = UIImage(systemName: "bed.double.fill")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .black
        $0.tintColor = .white
    }
    
    private let sectionNameLabel = UILabel().then {
        $0.text = "수면 | 기상"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        $0.textColor = .white
    }
    
    private let cellDivider = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
                
        addSubview(pageNameLabel)
        pageNameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
        }
        
        addSubview(sectionIconImageView)
        sectionIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.greaterThanOrEqualTo(pageNameLabel).offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        addSubview(sectionNameLabel)
        sectionNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(sectionIconImageView.snp.trailing).offset(4)
            make.centerY.equalTo(sectionIconImageView)
        }
        
        addSubview(cellDivider)
        cellDivider.snp.makeConstraints { make in
            make.top.equalTo(snp.bottom).inset(1)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureUI() {
        // .normalAlarm이라면 pageNameLabel과 sectionIconImageView 숨기기
        if type == .normalAlarm {
            pageNameLabel.snp.makeConstraints { make in
                make.height.equalTo(0)
            }
            
            sectionIconImageView.isHidden = true
            sectionNameLabel.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(10)
                make.bottom.equalToSuperview().inset(10)
            }
            sectionNameLabel.text = "기타"
        }
    }
}

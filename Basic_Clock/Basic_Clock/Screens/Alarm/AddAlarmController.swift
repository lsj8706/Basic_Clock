//
//  AddAlarmController.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/01.
//

import UIKit

class AddAlarmController: UIViewController {
    //MARK: - UI


    private let headerView = UIView().then {
        
        lazy var cancelButton = UIButton().then {
            $0.setTitle("취소", for: .normal)
            $0.setTitleColor(.orange, for: .normal)
            $0.addTarget(self, action: #selector(cancelButtonDidTap(sender:)), for: .touchUpInside)
        }
        
        let pageTitleLabel = UILabel().then {
            $0.text = "알람 추가"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        lazy var saveButton = UIButton().then {
            $0.setTitle("저장", for: .normal)
            $0.setTitleColor(.orange, for: .normal)
            $0.addTarget(self, action: #selector(saveButtonDidTap(sender:)), for: .touchUpInside)
        }
        
        $0.addSubview(cancelButton)
        $0.addSubview(pageTitleLabel)
        $0.addSubview(saveButton)
        
        cancelButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        pageTitleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "myBackgroundColor")
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
    
    //MARK: - Helpers
    
    //MARK: - Actions
    @objc func cancelButtonDidTap(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc func saveButtonDidTap(sender: UIButton) {
        print("save btn tapped")
    }
}

//
//  AddAlarmController.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/01.
//

import UIKit

class AddAlarmController: UIViewController {
    
    //MARK: - UI
    private lazy var headerView = UIView().then {
        lazy var cancelButton = UIButton().then {
            $0.setTitle("취소", for: .normal)
            $0.setTitleColor(.orange, for: .normal)
            $0.addTarget(self, action: #selector(self.cancelButtonDidTap(sender:)), for: .touchUpInside)
        }
        
        let pageTitleLabel = UILabel().then {
            $0.text = "알람 추가"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        lazy var saveButton = UIButton().then {
            $0.setTitle("저장", for: .normal)
            $0.setTitleColor(.orange, for: .normal)
            $0.addTarget(self, action: #selector(self.saveButtonDidTap(sender:)), for: .touchUpInside)
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
    
    private lazy var datePicker = UIDatePicker().then {
        $0.datePickerMode = .time
        $0.preferredDatePickerStyle = .wheels
        $0.setValue(UIColor.white, forKeyPath: "textColor")
        $0.timeZone = .autoupdatingCurrent
        $0.addTarget(self, action: #selector(handleDatePickerDidScroll(sender:)), for: .valueChanged)
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
        
        self.view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(250)
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
    
    @objc func handleDatePickerDidScroll(sender: UIDatePicker) {
        print("ccc")
    }

}

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
        $0.tintColor = .orange
        $0.addTarget(self, action: #selector(handleDatePickerDidScroll(sender:)), for: .valueChanged)
    }
    
    private lazy var repeatView = UIView().then {
        $0.backgroundColor = .darkGray
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleRepeatViewDidTap(sender:)))
        $0.addGestureRecognizer(tap)
    }
    
    private lazy var setupTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.register(setupTableViewCell.self, forCellReuseIdentifier: setupTableViewCell.identifier)
        $0.isScrollEnabled = false
        $0.backgroundColor = UIColor(named: "myBackgroundColor")
        $0.separatorColor = .darkGray
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureDelegate()
    }
    
    //MARK: - Helpers
    private func configureDelegate() {
        setupTableView.delegate = self
        setupTableView.dataSource = self
    }
    
    private func configureUI() {
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
        
        self.view.addSubview(setupTableView)
        setupTableView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
    }
    
    
    //MARK: - Actions
    @objc func cancelButtonDidTap(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc func saveButtonDidTap(sender: UIButton) {
        print("save btn tapped")
    }
    
    @objc func handleDatePickerDidScroll(sender: UIDatePicker) {
        print("date picker did scroll")
    }
    
    @objc func handleRepeatViewDidTap(sender: UITapGestureRecognizer) {
        print("repeat")
    }
}


extension AddAlarmController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: setupTableViewCell.identifier, for: indexPath) as? setupTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(named: "myDarkGray2")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

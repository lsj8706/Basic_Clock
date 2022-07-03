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
    
    private lazy var setupTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.register(setupTableViewCell.self, forCellReuseIdentifier: setupTableViewCell.identifier)
        $0.isScrollEnabled = false
        $0.backgroundColor = UIColor(named: "myBackgroundColor")
        $0.separatorColor = .darkGray
        $0.contentInset = .zero
        $0.contentInsetAdjustmentBehavior = .never
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
            make.top.equalTo(datePicker.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
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
        print(sender.date)
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
        switch indexPath.row {
        case 0:
            cell.setData(settingName: "반복", settingValueName: "안 함")
        case 1:
            cell.setData(settingName: "레이블", settingValueName: "알람")
        case 2:
            cell.setData(settingName: "사운드", settingValueName: "희망")
        case 3:
            cell.settingNameLabel.text = "다시 알림"
            cell.changeCellToReplaceAlarmCell()
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // 테이블 뷰 기본 상하단 여백 (기본 header, footer 없애기)
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

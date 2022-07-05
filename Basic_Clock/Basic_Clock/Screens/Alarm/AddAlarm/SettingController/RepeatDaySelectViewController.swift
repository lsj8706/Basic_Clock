//
//  RepeatDaySelectViewController.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/03.
//

import UIKit

protocol RepeatDaySelectViewControllerDelegate: AnyObject {
    func didSelectDays(selectedDays: [String])
}

class RepeatDaySelectViewController: UIViewController {

    //MARK: - Properties
    weak var delegate: RepeatDaySelectViewControllerDelegate?
    
    private let days: [String] = ["일요일마다", "월요일마다", "화요일마다", "수요일마다", "목요일마다", "금요일마다", "토요일마다"]
    
    //MARK: - UI
    private lazy var headerView = UIView().then {
        lazy var cancelButton = UIButton().then {
            $0.setTitle("뒤로", for: .normal)
            $0.setTitleColor(.orange, for: .normal)
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            $0.tintColor = .orange
            $0.addTarget(self, action: #selector(self.cancelButtonDidTap(sender:)), for: .touchUpInside)
        }
        
        let pageTitleLabel = UILabel().then {
            $0.text = "반복"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        
        $0.addSubview(cancelButton)
        $0.addSubview(pageTitleLabel)
        
        cancelButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        pageTitleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    let dayTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.register(RepeatDaySelectTableViewCell.self, forCellReuseIdentifier: RepeatDaySelectTableViewCell.identifier)
        $0.backgroundColor = UIColor(named: "myBackgroundColor")
        $0.separatorColor = .darkGray
        $0.contentInset = .zero
        $0.contentInsetAdjustmentBehavior = .never
        $0.allowsMultipleSelection = true
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegate()
        configureUI()
    }
    
    //MARK: - Helepers
    private func configureDelegate() {
        dayTableView.delegate = self
        dayTableView.dataSource = self
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "myBackgroundColor")
        
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(dayTableView)
        dayTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView).offset(100)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(350)
        }
    }

    //MARK: - Actions
    @objc func cancelButtonDidTap(sender: UIButton) {
        guard let selectedIndex = dayTableView.indexPathsForSelectedRows else { return }
        let selectedDays = selectedIndex.map({$0[1]}).sorted().map({days[$0]})
        
        delegate?.didSelectDays(selectedDays: selectedDays)
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK: - TableViewDelegate
extension RepeatDaySelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepeatDaySelectTableViewCell.identifier, for: indexPath) as? RepeatDaySelectTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(named: "myDarkGray2")
        cell.selectionStyle = .none
        cell.tintColor = .orange
        cell.settingNameLabel.text = days[indexPath.row]
        
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
}

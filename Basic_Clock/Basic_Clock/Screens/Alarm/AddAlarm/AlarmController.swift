//
//  AlarmController.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit
import Then
import SnapKit

class AlarmController: UIViewController {
    //MARK: - Properties
    var pageNameLabelHeight: Double = 40
    
    //MARK: - UI
    private let headerView = HeaderView()
    
    private let alarmCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .black
        return cv
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegate()
        configureCollectionView()
        configureUI()
    }
    
    //MARK: - Helpers
    private func configureUI() {
        self.view.addSubview(headerView)
        headerView.delegate = self
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(alarmCollectionView)
        alarmCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    private func configureDelegate() {
        alarmCollectionView.delegate = self
        alarmCollectionView.dataSource = self
    }
    
    private func configureCollectionView() {
        alarmCollectionView.register(SleepAlarmCollectionViewCell.self, forCellWithReuseIdentifier: SleepAlarmCollectionViewCell.identifier)
        alarmCollectionView.register(AlarmCollectionViewCell.self, forCellWithReuseIdentifier: AlarmCollectionViewCell.identifier)
        alarmCollectionView.register(AlarmSectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlarmSectionHeaderCollectionReusableView.identifier)
    }
}



//MARK: - UICollectionViewDelegate
extension AlarmController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= pageNameLabelHeight{
            headerView.pageTitleLabel.isHidden = true
        } else {
            headerView.pageTitleLabel.isHidden = false
        }
    }
}

//MARK: - UICollectionViewDataSource
extension AlarmController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlarmSectionHeaderCollectionReusableView.identifier, for: indexPath) as? AlarmSectionHeaderCollectionReusableView else { return UICollectionReusableView() }
            
            if indexPath.section == 1 {
                header.type = .normalAlarm
            }
            
            if header.pageNameLabel.frame.height != 0 {
                pageNameLabelHeight = header.pageNameLabel.frame.height
            }
            
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SleepAlarmCollectionViewCell.identifier, for: indexPath) as? SleepAlarmCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmCollectionViewCell.identifier, for: indexPath) as? AlarmCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension AlarmController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 60)
        } else {
            return CGSize(width: collectionView.frame.width, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 100)
        }
        return CGSize(width: view.frame.width, height: 60)
    }
}

//MARK: - HeaderViewDelegate
extension AlarmController: HeaderViewDelegate {
    func presentAddAlarmController(_ view: UIView) {
        let addAlarmController = AddAlarmController()
        let nav = UINavigationController(rootViewController: addAlarmController)
        self.present(nav, animated: true)
    }
}

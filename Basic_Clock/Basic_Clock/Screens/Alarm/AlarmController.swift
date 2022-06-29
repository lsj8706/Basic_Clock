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
    //MARK: - UI
    private let headerView = HeaderView()
    private let alarmCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        return cv
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegate()
        configureCollectionView()
        
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(alarmCollectionView)
        alarmCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //MARK: - Helpers
    private func configureDelegate() {
        alarmCollectionView.delegate = self
        alarmCollectionView.dataSource = self
    }
    
    private func configureCollectionView() {
        alarmCollectionView.register(SleepAlarmCollectionViewCell.self, forCellWithReuseIdentifier: SleepAlarmCollectionViewCell.identifier)
        alarmCollectionView.register(AlarmCollectionViewCell.self, forCellWithReuseIdentifier: AlarmCollectionViewCell.identifier)
    }
}



//MARK: - UICollectionViewDelegate
extension AlarmController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension AlarmController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
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
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

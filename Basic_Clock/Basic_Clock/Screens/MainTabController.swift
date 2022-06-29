//
//  ViewController.swift
//  Basic_Clock
//
//  Created by sejin on 2022/06/30.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTabBar()
    }
    
    
    func configureTabBar() {
        view.backgroundColor = .black
        
        let wordTime = templateNavigationController(title: "세계 시계", unselectedImage: UIImage(systemName: "globe")!, selectedImage: UIImage(systemName: "globe")!, rootViewController: WorldTimeController())
        
        let alarm = templateNavigationController(title: "알람", unselectedImage: UIImage(systemName: "alarm.fill")!, selectedImage: UIImage(systemName: "alarm.fill")!, rootViewController: AlarmController())
        
        let stopwatch = templateNavigationController(title: "스톱워치", unselectedImage: UIImage(systemName: "stopwatch.fill")!, selectedImage: UIImage(systemName: "stopwatch.fill")!, rootViewController: StopwatchController())
        
        let timer = templateNavigationController(title: "타이머", unselectedImage: UIImage(systemName: "timer")!, selectedImage: UIImage(systemName: "timer")!, rootViewController: TimerController())
        
        viewControllers = [wordTime, alarm, stopwatch, timer]
        
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .gray
    }

    
    func templateNavigationController(title: String, unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}


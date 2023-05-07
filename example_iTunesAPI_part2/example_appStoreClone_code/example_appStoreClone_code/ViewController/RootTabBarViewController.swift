//
//  ViewController.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarItem()
    }
    
    // 탭바 색상 설정
    func setupTabBar() {
        // 다크모드를 위해서 탭바의 색상을 지정하고 틴트컬러 설정
        tabBar.barTintColor = .systemBackground
        tabBar.tintColor = .link
    }
    
    // 탭바 아이템 설정
    func setupTabBarItem() {
        // 메인 화면
        let todayViewController = TodayCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        // 탭의 이미지와 텍스트 설정
        todayViewController.tabBarItem = UITabBarItem(
            title: "today_title".localized,
            image: UIImage(systemName: "doc.richtext"),
            selectedImage: UIImage(systemName: "doc.richtext.fill"))
        
        // today에서 넘어가는것이기 때문에 UINavigationController 사용
        let appViewController = UINavigationController(rootViewController: AppViewController())
        appViewController.tabBarItem = UITabBarItem(
            title: "app_title".localized,
            image: UIImage(systemName: "gamecontroller"),
            selectedImage: UIImage(systemName: "gamecontroller.fill"))
        
        // today에서 넘어가는것이기 때문에 UINavigationController 사용
        let searchViewController = UINavigationController(rootViewController: SearChViewController())
        searchViewController.tabBarItem = UITabBarItem(
            title: "search_title".localized,
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        
        // Tabbar에 어떤 것들을 사용할것인지 적어주기
        viewControllers = [
            todayViewController,
            appViewController,
            searchViewController
        ]
    }
}


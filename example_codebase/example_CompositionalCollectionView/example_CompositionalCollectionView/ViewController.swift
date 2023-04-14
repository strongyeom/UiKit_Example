//
//  ViewController.swift
//  example_CompositionalCollectionView
//
//  Created by 염성필 on 2023/04/14.
//

import UIKit

// SceneDelegate에서 rootViewController = RootTabBarViewController으로 설정하기
class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarItem()
    }
    
    // TabBar 배경 및 색상 설정
    func setupTabBar() {
        tabBar.barTintColor = .systemBackground
        tabBar.tintColor = .link
    }
    
    // TabBar 라벨 설정
    func setupTabBarItem() {
        
        let todayViewController = TodayCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        todayViewController.tabBarItem = UITabBarItem(
            title: "투데이", image: UIImage(systemName: "doc.richtext.fill"), selectedImage: UIImage(systemName: "doc.richtext.fill"))
        
        let appViewController = UINavigationController(rootViewController: AppViewController())
        appViewController.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller.fill"))
        
        let searchController = UINavigationController(rootViewController: SearchViewController())
        searchController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        // An array of the root view controllers displayed by the tab bar interface.
        viewControllers = [
        todayViewController,
        appViewController,
        searchController
        ]
    }


}


//
//  AppViewController.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

class AppViewController: UIViewController {
    
    private var sections: [AppItem] = []
    
    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //collectionView.delegate = self
        collectionView.dataSource = self
        
        // cell
        collectionView.register(AppLargeItemCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AppLargeItemCollectionViewCell.self))
        collectionView.register(AppSmallItemCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AppSmallItemCollectionViewCell.self))
        
        // header
        collectionView.register(AppSmallItemCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: AppSmallItemCollectionHeaderView.self))
        
        return collectionView
    }()
    
    private lazy var layout: UICollectionViewLayout = {
        return UICollectionViewCompositionalLayout { [weak self] section, _ -> NSCollectionLayoutSection? in
            guard let sectionType = self?.sections[section].type else {
                return nil
            }
            switch sectionType {
            case .largeItem:
                return self?.createLargeItemSection()
            case .smallItem:
                return self?.createSmallItemSection()
            }
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "app_title".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        // large title text 설정
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
    }
    
    
    // MARK: - LargeItemSection
    private func createLargeItemSection() -> NSCollectionLayoutSection {
        // size setting
        let sectionMargin: CGFloat = 10
        let groupMargin: CGFloat = 6
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.width - (sectionMargin * 2)), heightDimension: .estimated(350))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: groupMargin, bottom: 0, trailing: groupMargin)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: sectionMargin + groupMargin, leading: sectionMargin, bottom: sectionMargin + groupMargin, trailing: sectionMargin)
        return section
    }
    
    
    // MARK: - SmallItemSection
    private func createSmallItemSection() -> NSCollectionLayoutSection {
        //item
        let itemMargin: CGFloat = 4
        let sectionMargin: CGFloat = 12
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: itemMargin, bottom: 0, trailing: itemMargin)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.width - (sectionMargin * 2)), heightDimension: .estimated(250))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)

//        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(top: sectionMargin + itemMargin, leading: sectionMargin, bottom: sectionMargin + itemMargin, trailing: sectionMargin)
        
        //header
        let sectionHeader = self.createSmallItemSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    
    // MARK: - SmallItem Header
    private func createSmallItemSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        // section header 사이즈
        let layoutSectionHeader = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
        
        // section header 레이아웃
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeader, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        return sectionHeader
    }
}
extension AppViewController: UICollectionViewDataSource {
    // section의 갯수를 리턴
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    // section이 가지고 있는 아이템의 갯수를 리턴
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = sections[section]
        return section.items.count
    }
    
    // section의 타입에 따라, cell을 리턴, 우리가 만든 cell을 리턴
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = sections[indexPath.section].type
        switch sectionType {
        case .largeItem:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AppLargeItemCollectionViewCell.self), for: indexPath) as? AppLargeItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let item = sections[indexPath.section].items[indexPath.row] as? AppLargeItem else {
                return UICollectionViewCell()
            }
            cell.setup(item: item)
            return cell
        case .smallItem:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AppSmallItemCollectionViewCell.self), for: indexPath) as? AppSmallItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let item = sections[indexPath.section].items[indexPath.row] as? AppSmallItem else {
                return UICollectionViewCell()
            }
            cell.setup(item: item)
            return cell
        }
    }
    // header 구현
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: AppSmallItemCollectionHeaderView.self), for: indexPath) as? AppSmallItemCollectionHeaderView else {
                return UICollectionReusableView()
            }
            let item = sections[indexPath.section]
            headerView.setup(mainText: item.mainText)
            return headerView
        }
        return UICollectionReusableView()
    }
}

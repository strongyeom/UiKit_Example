//
//  TodayCollectionViewController.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit


class TodayCollectionViewController: UICollectionViewController {
    
    private lazy var statusBarView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.alpha = 0.9
        return view
    }()
    
    let todaySmallItemSectionBackground = "TodaySmallItemSectionBackground"
    let sectionDefaultMargin: CGFloat = 16
    var items: [TodayItem] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
      setupLayout()
    }
    
    // 스크롤 위치에 따른 색상 및 isHidden 처리
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isStatusBarHidden = scrollView.contentOffset.y < 0
        if isStatusBarHidden {
            statusBarView.backgroundColor = .clear
        } else {
            statusBarView.backgroundColor = .systemBackground
        }
        statusBarView.isHidden = isStatusBarHidden
    }
    
    private func setupLayout() {
        view.backgroundColor = .black
        
        // status bar view
        view.addSubview(statusBarView)
        statusBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statusBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            statusBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension TodayCollectionViewController {
    private func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        
        collectionView.collectionViewLayout = layout()
        
        // cell
        collectionView.register(TodayAccountCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TodayAccountCollectionViewCell.self))
        collectionView.register(TodayLargeItemCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TodayLargeItemCollectionViewCell.self))
        collectionView.register(TodaySmallItemCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: TodaySmallItemCollectionViewCell.self))
        
        // header
        collectionView.register(TodaySmallItemCollectionHearderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: TodaySmallItemCollectionHearderView.self))
        
        // section background
        collectionView.collectionViewLayout.register(TodaySmallItemBackgroundView.self, forDecorationViewOfKind: String(describing: TodaySmallItemBackgroundView.self))
    }
}

extension TodayCollectionViewController {
    private func layout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { [weak self] section, _ -> NSCollectionLayoutSection? in
            let itemType = self?.items[section].type
            switch itemType {
            case .accountProfile:
                return self?.createAccountSection()
                
            case .largeItem:
                return self?.createLargeItemSection()
                
            case .smallItem:
                return self?.createSmallItemSection()
                
            default:
                return nil
            }
        }
    }
    
    // section 마다 다른 레이아웃을 가지기 때문에 분기 처리
    private func createAccountSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(96))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: sectionDefaultMargin, bottom: 0, trailing: sectionDefaultMargin)
        
        return section
    }
    
    private func createLargeItemSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: sectionDefaultMargin, leading: sectionDefaultMargin, bottom: sectionDefaultMargin, trailing: sectionDefaultMargin)
        
        return section
    }
    
    private func createSmallItemSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(collectionView.frame.size.width - 32), heightDimension: .absolute(310))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: sectionDefaultMargin, leading: sectionDefaultMargin, bottom: sectionDefaultMargin + 30, trailing: sectionDefaultMargin)
        // header 설정
        let sectionHeader = self.creatSmallItemSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        let sectionBackground = NSCollectionLayoutDecorationItem.background(
            elementKind: todaySmallItemSectionBackground)
        section.decorationItems = [sectionBackground]
        
        
        return section
    }
    
    private func creatSmallItemSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        // section header 사이즈
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
        
        // section header Layout
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return sectionHeader
    }
    
}

extension TodayCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemType = items[indexPath.section].type
        switch itemType {
        case .accountProfile:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TodayAccountCollectionViewCell.self), for: indexPath) as? TodayAccountCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case .largeItem:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TodayLargeItemCollectionViewCell.self), for: indexPath) as? TodayLargeItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let largeItem = items[indexPath.section].items[indexPath.row] as? TodayLargeItem else {
                return UICollectionViewCell()
            }
            cell.setup(largeItem: largeItem)
            return cell
        case .smallItem:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TodaySmallItemCollectionViewCell.self), for: indexPath) as? TodaySmallItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let smallItem = items[indexPath.section].items[indexPath.row] as? TodaySmallItem else {
                return UICollectionViewCell()
            }
            cell.setup(item: smallItem)
            return cell
        }
    }
    
    // header 리턴
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: TodaySmallItemCollectionViewCell.self), for: indexPath) as? TodaySmallItemCollectionHearderView else {
                return UICollectionReusableView()
            }
            let item = items[indexPath.section]
            headerView.setup(mainText: item.mainText, subText: item.subText)
            return headerView
    }
        return UICollectionReusableView()
    
    }
}

extension TodayCollectionViewController {
    private func setData() {
        items = [
            TodayItem(type: .accountProfile, items: ["myAccount"]),
            
            TodayItem(type: .largeItem, items: [
                TodayLargeItem(
                    subText: "함께하는 프로젝트!",
                    mainText: "Skillist의\n속업오버로드~",
                    bottomText: "우리 같이 공부해요.",
                    subTitleColor: .darkGray,
                    bottomTitleColor: .darkGray,
                    imageURL: nil,
                    image: RandomData.image
                )
            ]),
            
            TodayItem(type: .smallItem, items: [
                TodaySmallItem(mainText: "랜덤 skillist", subText: "생각보다 빡세네요.", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image),
                TodaySmallItem(mainText: "랜덤 skillist", subText: "코딩량이 많아요", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image),
                TodaySmallItem(mainText: "랜덤 skillist", subText: "그래도 재밌어요.", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image),
                TodaySmallItem(mainText: "랜덤 skillist", subText: "완전 재밌어요.", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image)
            ], subText: "Skillist의 앱 목록이에요.", mainText: "대박 대박 앱"),
            
            TodayItem(type: .largeItem, items: [
                TodayLargeItem(
                    subText: "이렇게 하세요.",
                    mainText: "클론코딩으로 실력을 키우자.",
                    bottomText: "아주 좋은 방법!",
                    subTitleColor: .white,
                    mainTitleColor: .white,
                    bottomTitleColor: .white,
                    imageURL: nil,
                    image: RandomData.image
                )
            ]),
            
            TodayItem(type: .largeItem, items: [
                TodayLargeItem(
                    subText: "함께하는 프로젝트!",
                    mainText: "Skillist의\n속업오버로드~",
                    bottomText: "우리 같이 공부해요.",
                    subTitleColor: .darkGray,
                    bottomTitleColor: .darkGray,
                    imageURL: nil,
                    image: RandomData.image
                )
            ]),
            
            TodayItem(type: .smallItem, items: [
                TodaySmallItem(mainText: "랜덤 skillist", subText: "생각보다 빡세네요.", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image),
                TodaySmallItem(mainText: "랜덤 skillist", subText: "코딩량이 많아요", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image),
                TodaySmallItem(mainText: "랜덤 skillist", subText: "그래도 재밌어요.", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image),
                TodaySmallItem(mainText: "랜덤 skillist", subText: "완전 재밌어요.", isInAppPurchase: RandomData.boolean, isInstalled: RandomData.boolean, imageURL: nil, image: RandomData.image)
            ], subText: "Skillist의 앱 목록이에요.", mainText: "대박 대박 앱"),
            
            TodayItem(type: .largeItem, items: [
                TodayLargeItem(
                    subText: "이렇게 하세요.",
                    mainText: "클론코딩으로 실력을 키우자.",
                    bottomText: "아주 좋은 방법!",
                    subTitleColor: .white,
                    mainTitleColor: .white,
                    bottomTitleColor: .white,
                    imageURL: nil,
                    image: RandomData.image
                )
            ])
        ]
    }
}


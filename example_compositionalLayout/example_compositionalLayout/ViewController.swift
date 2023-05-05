//
//  ViewController.swift
//  example_compositionalLayout
//
//  Created by 염성필 on 2023/05/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    fileprivate let systemImageNameArray = [
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCompositionalLayoutforFirst()
    }
    
    
    @IBAction func segmentTapControlled(_ sender: UISegmentedControl) {
        print("segmentTapControlled() called \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0:
            collectionView.collectionViewLayout = createCompositionalLayoutforFirst()
        case 1:
            collectionView.collectionViewLayout = createCompositionalLayoutforSecond()
        case 2:
            collectionView.collectionViewLayout = createCompositionalLayoutforThird()
        default:
            break
        }
    }
    

}

extension ViewController {
    
    fileprivate func createCompositionalLayoutforFirst() -> UICollectionViewLayout {
        print("createCompositionalLayout() called")
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 형태로 들어옴 리턴값은 NSCollectionLayoutSection
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템 -> 그룹 -> 섹션 형태로 이루어져 있음
            
            // 아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 그룹의 높이를 변경 할 수있음 => 변경할 부분
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 만들기 => 변경할 부분
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            
            // 그룹을 섹션으로 만들기
            let section = NSCollectionLayoutSection(group: group)
           // section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
    
    fileprivate func createCompositionalLayoutforSecond() -> UICollectionViewLayout {
        print("createCompositionalLayout() called")
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 형태로 들어옴 리턴값은 NSCollectionLayoutSection
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템 -> 그룹 -> 섹션 형태로 이루어져 있음

            // 사진 한장
            let fullItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/4)))
            fullItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            
            
            
            // 사진 한장에 세로로 사진 두장
            let mainitem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1.0)))

            let pairItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
            
            pairItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)), repeatingSubitem: pairItem, count: 2)
            
            let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(4/9)), subitems: [mainitem, trailingGroup])

            // 사진 세장
            let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)))
            tripletItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let tripletGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(2/9)), subitems: [tripletItem, tripletItem, tripletItem])
            
            
            // 사진 왼쪽에 세로두장 오른쪽에 한장
            let mainWithPairReversedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(4/9)), subitems: [trailingGroup, mainitem])
            
            
            let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(16/9)), subitems: [fullItem, mainWithPairGroup, tripletGroup, mainWithPairReversedGroup])
//
            // 그룹을 섹션으로 만들기
            let section = NSCollectionLayoutSection(group: nestedGroup)
           // section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
    
    fileprivate func createCompositionalLayoutforThird() -> UICollectionViewLayout {
        print("createCompositionalLayout() called")
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 형태로 들어옴 리턴값은 NSCollectionLayoutSection
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템 -> 그룹 -> 섹션 형태로 이루어져 있음
            
            // 아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간의 간격 설정
           // item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 그룹의 높이를 변경 할 수있음 => 변경할 부분
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 만들기 => 변경할 부분
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            
            // 그룹을 섹션으로 만들기
            let section = NSCollectionLayoutSection(group: group)
           // section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCollectionViewCell.self), for: indexPath) as! MyCollectionViewCell
        

        
        cell.imageName = systemImageNameArray[indexPath.item]
        cell.backgroundColor = .yellow
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        // cell.iconImage.image = UIImage(systemName: systemImageNameArray[indexPath.item])
        // cell.iconName.text = systemImageNameArray[indexPath.item]
        return cell
    }
}

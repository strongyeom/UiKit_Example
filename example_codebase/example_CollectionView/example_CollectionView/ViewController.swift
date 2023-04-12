//
//  ViewController.swift
//  example_CollectionView
//
//  Created by 염성필 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Properties
    let collectionview: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        return collectionview
    }()
    
    var items: [Item] = [
    Item(imageString: "image1", mainTitle: "das", subTitle: "132"),
    Item(imageString: "image2", mainTitle: "dfsd", subTitle: "132"),
    Item(imageString: "image3", mainTitle: "fdf;sl", subTitle: "132"),
    Item(imageString: "image4", mainTitle: "123", subTitle: "132"),
    Item(imageString: "image5", mainTitle: "rokro", subTitle: "132"),
    ]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionview.dataSource = self
        collectionview.delegate = self
        
        view.addSubview(collectionview)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.iConImage.image = UIImage(named: items[indexPath.row].imageString!)
        cell.maintitle.text = items[indexPath.row].mainTitle
        cell.subDescription.text = items[indexPath.row].subTitle
        return cell
    }
    
    
}

// MARK: 사이즈를 정할 수있음 FlowLayout 인거 주의
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // 사이즈 조정
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // 셀의 간격이 10이므로 count사이의 간격이므로 -30, + 가로로 여백을 왼쪽 5, 오른쪽 5이니까 - 10
        return CGSize(width: view.frame.width , height: 100)
    }

}


#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}


struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif



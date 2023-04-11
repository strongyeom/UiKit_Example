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
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        return collectionview
    }()
    
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
        collectionview.backgroundColor = .yellow
        
        collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .red
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
        return CGSize(width: (view.frame.width - 30 - 10)/4, height: (view.frame.width - 30 - 10)/4)
    }
    
    // 양옆 사이즈 간격 0으로 조정
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 10
    }
   // 셀과 view와의 여백을 설정 할 수 있음
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
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



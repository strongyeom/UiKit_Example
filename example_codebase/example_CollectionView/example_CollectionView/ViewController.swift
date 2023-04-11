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
    
    
    // 양옆 사이즈 간격 0으로 조정
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



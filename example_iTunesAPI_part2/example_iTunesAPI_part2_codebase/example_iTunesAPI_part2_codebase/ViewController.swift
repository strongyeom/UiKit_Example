//
//  ViewController.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Properties
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionview
    }()
    
    let array: [Item] = [
    Item(maintitle: "123", subtitle: "fsdfd"),
    Item(maintitle: "mdklf", subtitle: "fsdfd"),
    Item(maintitle: "vvpwe", subtitle: "fsdfd"),
    Item(maintitle: "dqdq", subtitle: "fsdfd"),
    Item(maintitle: "dmpom", subtitle: "fsdfd"),
    Item(maintitle: "123", subtitle: "fsdfd"),
    Item(maintitle: "mdklf", subtitle: "fsdfd"),
    Item(maintitle: "vvpwe", subtitle: "fsdfd"),
    Item(maintitle: "dqdq", subtitle: "fsdfd"),
    Item(maintitle: "dmpom", subtitle: "fsdfd"),
    Item(maintitle: "123", subtitle: "fsdfd"),
    Item(maintitle: "mdklf", subtitle: "fsdfd"),
    Item(maintitle: "vvpwe", subtitle: "fsdfd"),
    Item(maintitle: "dqdq", subtitle: "fsdfd"),
    Item(maintitle: "dmpom", subtitle: "fsdfd"),
    ]
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setup()
      
    }
    
    
    
    func setup() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing:  CollectionViewCell.self))
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.appName.text = array[indexPath.row].maintitle
        cell.subDescription.text = array[indexPath.row].subtitle
        return cell
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: view.frame.width, height: 50)
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



//
//  FullScreenImageViewController.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/06.
//

import UIKit



// Todo - 풀 스크린 프레임 간격 조정 


class FullScreenImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    private var previousOffset: CGFloat = 0
    
    private var currentPage: Int = 0
   

    // 전 화면에서 ScreenShotUrl 배열 받아오기
    var fullScreenImageUrl: [String]?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
  
    func setupCollectionView() {
        
       
        collectionView.dataSource = self
        collectionView.delegate = self
        
      
        let collectionViewWidth = UIScreen.main.bounds.width
        let collectionViewHeight = UIScreen.main.bounds.height - 80
       
        flowLayout.minimumLineSpacing = 10
        //flowLayout.minimumInteritemSpacing = 50
        print("계산 : cellWidthIncludingSpacing에 넣어주기 위한 가로 + spacing값: \(collectionViewWidth) + \(flowLayout.minimumInteritemSpacing)")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        flowLayout.scrollDirection = .horizontal
        
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false

        flowLayout.itemSize = CGSize(width: collectionViewWidth, height: collectionViewHeight)
        collectionView.collectionViewLayout  = flowLayout
    }
    
    @IBAction func tabButtonClicked(_ sender: UIButton) {
        print("FullScreenImageViewController 화면이 내려갑니다.")
        dismiss(animated: true)
    }


    
   
}
extension FullScreenImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let fullScreenImageUrl = fullScreenImageUrl?.count else { return 0 }
        
        return fullScreenImageUrl
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FullScreenImageCollectionViewCell.self), for: indexPath) as! FullScreenImageCollectionViewCell
        //scrollViewWillEndDragging
        cell.fullImageUrl = fullScreenImageUrl![indexPath.item]
        print("FullScreen - 하나씩 URL 받아오는것", cell.fullImageUrl!)
        return cell
    }
}
extension FullScreenImageViewController: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        // CollectionView Item size
        let cellWidthIncludingSpacing = layout.itemSize.width + (layout.minimumLineSpacing)
        print("계산 : cellWidthIncludingSpacing : \(layout.itemSize.width) + \(layout.minimumLineSpacing)" )
        // 이동한 x좌표 값과 item의 크기를 비교후 페이징 값 설정
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        print("계산 : 이동한 x값 \(scrollView.contentOffset.x)")
        print("계산 : x값과 item크기를 비교한 값 \(estimatedIndex)")
        let index: Int
        // 스크롤 방향 체크
        // item 절반 사이즈만큼 스크롤로 판단하여 올림, 내림 처리
        print("계산 : 터치가 해제된 순간 스크롤 View의 속도 \(velocity.x)")
        if velocity.x > 0 {
            
            index = Int(ceil(estimatedIndex))
            print("계산 : 소수점 아래 버리고 정수부에 1을 더함 \(index)", "스크롤을 누르고 오른쪽으로 스크롤 했음 ")
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
            print("계산 : 소수점 아래 버림 \(index)", "스크롤을 누르고 왼쪽으로 스크롤 했음")
        } else {
            index = Int(round(estimatedIndex))
            print("계산 : 반올림 \(index)")
        }
        
        // 위 코드를 통해 페이징 좌표 값을  targetContentOffset에 대입
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
        print("계산 : targetContentOffset : \( targetContentOffset.pointee)")
    }
}


//
//  DownloadableImageView.swift
//  example_CompositionalCollectionView
//
//  Created by 염성필 on 2023/04/15.
//

import UIKit

// 이미지를 다운로드 할 수 있는 이미지뷰
class DownloadableImageView: UIImageView {
    
    // 이미지뷰의 다운로드 취소 여부 확인
    var isCancel: Bool = false
    
    // 이미지 다운로드 실패 시 이미지뷰 처리
    private var isFail: Bool = false {
        willSet {
            loadingView.stopAnimating()
        }
    }
    
    // 이미지 뷰에서 다운로드 중을 보여줄 인디케이터
    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView()
        loadingView.hidesWhenStopped = true
        loadingView.stopAnimating()
        return loadingView
    }()
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // 이미지 url 입력하여 다운로드
    func downloadImage(url: String) {
        isCancel = false
        isFail = false
        
        // 이미지 캐시하여, 이미지가 존재하면, 이미지 적용
        if let image = ImageCache.shared.object(forKey: url as NSString) {
            self.image = image
        }
        
        guard let url = URL(string: url) else {
            self.isFail = true
            return
        }
        
        // 이미지 다운로드 시작을 사용자에게 알림
        loadingView.startAnimating()
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard error == nil,
                  let _ = response as? HTTPURLResponse,
                  let data = data,
                  let image = UIImage(data: data) else {
                    print("imageDownLoad error1")
                self.isFail = true
                return
            }
            
            // 이미지 캐시
            ImageCache.shared.setObject(image, forKey: url.absoluteString as NSString)
            
            // 이미지 다운을 취소한 경우 중단
            if self.isCancel {
                return
            }
            
            // 다운받은 이미지 적용
            DispatchQueue.main.async {
                self.image = image
                self.loadingView.stopAnimating()
            }
        }
        .resume()
        
        
        
        
    }
    
    
    
    
    
}

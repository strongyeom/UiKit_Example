//
//  DownloadableImageView.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

// 이미지를 다운로드 할 수 있는 이미지 뷰 ( 이미지뷰를 상속 받음 )
class DownloadableImageView: UIImageView {
    
    // 이미지 뷰에서 다운로드 중을 보여줄 인디케이터
    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView()
        loadingView.hidesWhenStopped = true
        loadingView.stopAnimating()
        return loadingView
    }()
    
    // 이미지 뷰에서 다운로드 실패를 알려줄 인디케이터
    private lazy var textView: UILabel = {
        let textView = UILabel()
        textView.text = "image_load_fail".localized
        textView.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        textView.textColor = UIColor.white
        textView.textAlignment = .center
        textView.isHidden = true
        textView.numberOfLines = 0
        return textView
    }()
    
    // 이미지를 다운 받는 task
    var dataTask: URLSessionTask?
    
    // 이미지뷰의 다운로드 취소 여부 확인
    var isCancel: Bool = false {
        willSet {
            if newValue {
                dataTask?.cancel()
            }
        }
    }
    
    // 이미지 다운로드 실패 시 이미지뷰 처리
    private var isFail: Bool = false {
        willSet {
            DispatchQueue.main.async { [weak self] in
                self?.textView.isHidden = !newValue
                self?.loadingView.stopAnimating()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(loadingView)
        addSubview(textView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            textView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        
        ])
    }
    
    // 이미지 Url 입력하여 다운로드
    func downloadImage(url: String) {
        self.image = nil
        isFail = false
        isCancel = false
        
        // 이미지 캐시하여, 이미지가 존재하면 이미지 적용
        if let iamge = ImageCache.shared.object(forKey: url as NSString) {
            self.image = image
            return
        }
        
        // URL의 유효성 확인하기
        guard let url = URL(string: url) else {
            self.isFail = true
            return
        }
        
        // 이미지 다운로드 시작을 사용자에게 알림
        loadingView.startAnimating()
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }
            
            // 이미지를 못 가져왔다면 fail 처리
            guard let data = data,
                  let image = UIImage(data: data) else {
                self.isFail = true
                print("imageDownLoad error: \(error.unsafelyUnwrapped.localizedDescription)")
                return
            }
            
            // 이미지 캐시 추가
            ImageCache.shared.setObject(image, forKey: url.absoluteString as NSString)
            
            // 이미지 다운을 취소한 경우 중단
            if self.isFail {
                return
            }
            
            // 이미지뷰에 이미지를 적용하고, loadingView에 대한 애니메이션을 멈추고 숨김
            DispatchQueue.main.async {
                self.image = image
                self.isFail = false
            }
        })
        dataTask?.resume()
    }
}

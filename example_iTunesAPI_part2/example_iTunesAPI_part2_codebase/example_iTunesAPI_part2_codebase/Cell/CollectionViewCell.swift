//
//  CollectionViewCell.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    //IconImage
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // appName
    var appName: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 15)
        title.textColor = .black
        return title
    }()
    
    // appDescription
    var appDescription: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = .gray
        title.numberOfLines = 1
        return title
    }()
    
    // reviewText
    var reviewText: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 10)
        title.textColor = .gray
        return title
    }()
    
    // downLoadButton
    var downLoadButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    // MARK: - VStack
    lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appName, appDescription, reviewText])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        return stackView
    }()
    
    // MARK: - HStack
    lazy var hStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, vStack])
        stackView.axis = .horizontal
        stackView.spacing = 10
        //stackView.alignment = .top
        stackView.distribution = .fill
        return stackView
    }()
    
    // screenShot1
    var screenShot1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // screenShot2
    var screenShot2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // screenShot3
    var screenShot3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    // MARK: - ScreenShotHStack
    lazy var screenShotHStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [screenShot1, screenShot2, screenShot3])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    /// Icon 이미지 URL을 전달받는 속성
    var imageIconUrl: String? {
        didSet {
            loadIconImage()
        }
    }
    
    /// Icon 이미지 URL을 전달받는 속성
    var screenShot1Url: String? {
        didSet {
            loadScreenShot1Image()
        }
    }
    
    /// Icon 이미지 URL을 전달받는 속성
    var screenShot2Url: String? {
        didSet {
            loadScreenShot2Image()
        }
    }
    
    /// Icon 이미지 URL을 전달받는 속성
    var screenShot3Url: String? {
        didSet {
            loadScreenShot3Image()
        }
    }
    
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubview(hStack)
        addSubview(downLoadButton)
        addSubview(screenShotHStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        downLoadButton.translatesAutoresizingMaskIntoConstraints = false
        //integrationStack.translatesAutoresizingMaskIntoConstraints = false
        screenShotHStack.translatesAutoresizingMaskIntoConstraints = false
        downLoadButton.addTarget(self, action: #selector(downloadButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            
            
            hStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            downLoadButton.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            downLoadButton.widthAnchor.constraint(equalToConstant: 50),
            downLoadButton.leadingAnchor.constraint(equalTo: hStack.trailingAnchor, constant: 10),
            downLoadButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            screenShotHStack.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 10),
            screenShotHStack.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            screenShotHStack.trailingAnchor.constraint(equalTo: downLoadButton.trailingAnchor),
            screenShotHStack.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    @objc func downloadButtonClicked() {
        print("다운로드 버튼이 눌렸습니다.")
        
    }
    
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행
        self.iconImageView.image = nil
        self.screenShot1.image = nil
        self.screenShot2.image = nil
        self.screenShot3.image = nil
    }
    
    
    
    // URL ==> 이미지를 셋팅 하는 메서드
    func loadIconImage() {
        guard let urlString = imageIconUrl, let url = URL(string: urlString) else { return }
        
        // 오래걸리는 작업을 동시성 처리 ( 다른 쓰레드에서 일을 시킴 )
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 ( 오래걸리는데 동기적인 실행 )
            // ( 일반적으로 이미지를 가져올때 많이 사용 )
            guard let data = try? Data(contentsOf: url) else { return }
            
            // 오래 걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거
            guard urlString == url.absoluteString else { return }
            
            // 작업의 결과물을 이미지로 표시 ( 메인 큐 )
            DispatchQueue.main.async {
                self.iconImageView.image = UIImage(data: data)
            }
        }
    }
    
    // URL ==> 이미지를 셋팅 하는 메서드
    func loadScreenShot1Image() {
        guard let urlString = screenShot1Url, let url = URL(string: urlString) else { return }
        
        // 오래걸리는 작업을 동시성 처리 ( 다른 쓰레드에서 일을 시킴 )
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 ( 오래걸리는데 동기적인 실행 )
            // ( 일반적으로 이미지를 가져올때 많이 사용 )
            guard let data = try? Data(contentsOf: url) else { return }
            
            // 오래 걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거
            guard urlString == url.absoluteString else { return }
            
            // 작업의 결과물을 이미지로 표시 ( 메인 큐 )
            DispatchQueue.main.async {
                self.screenShot1.image = UIImage(data: data)
            }
        }
    }
    
    // URL ==> 이미지를 셋팅 하는 메서드
    func loadScreenShot2Image() {
        guard let urlString = screenShot2Url, let url = URL(string: urlString) else { return }
        
        // 오래걸리는 작업을 동시성 처리 ( 다른 쓰레드에서 일을 시킴 )
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 ( 오래걸리는데 동기적인 실행 )
            // ( 일반적으로 이미지를 가져올때 많이 사용 )
            guard let data = try? Data(contentsOf: url) else { return }
            
            // 오래 걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거
            guard urlString == url.absoluteString else { return }
            
            // 작업의 결과물을 이미지로 표시 ( 메인 큐 )
            DispatchQueue.main.async {
                self.screenShot2.image = UIImage(data: data)
            }
        }
    }
    
    // URL ==> 이미지를 셋팅 하는 메서드
    func loadScreenShot3Image() {
        guard let urlString = screenShot3Url, let url = URL(string: urlString) else { return }
        
        // 오래걸리는 작업을 동시성 처리 ( 다른 쓰레드에서 일을 시킴 )
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 ( 오래걸리는데 동기적인 실행 )
            // ( 일반적으로 이미지를 가져올때 많이 사용 )
            guard let data = try? Data(contentsOf: url) else { return }
            
            // 오래 걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거
            guard urlString == url.absoluteString else { return }
            
            // 작업의 결과물을 이미지로 표시 ( 메인 큐 )
            DispatchQueue.main.async {
                self.screenShot3.image = UIImage(data: data)
            }
        }
    }
    
    
}

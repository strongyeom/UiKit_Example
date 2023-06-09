//
//  DetailViewController.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/05.
//

import UIKit

class DetailViewController: UIViewController {
    // 앱 아이콘 및 앱 이름 설명 부분
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var AppLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    // 평가 부분
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var reviewAverage: UILabel!
    @IBOutlet weak var starReview: UILabel!
    // 사용 가능 부분
    @IBOutlet weak var useAge: UILabel!
    //차트 부분
    @IBOutlet weak var chart: UILabel!
    @IBOutlet weak var chartList: UILabel!
    // 개발자 부분
    @IBOutlet weak var artistPicture: UIImageView!
    @IBOutlet weak var artisName: UILabel!
    // 언어 부분
    @IBOutlet weak var languageCode: UILabel!
    @IBOutlet weak var languageCount: UILabel!
    // 스크린 샷 부분
    @IBOutlet var screenShotCollection: [UIImageView]!
    // 앱 상세 설명 부분
    @IBOutlet weak var detailDescription: UILabel!
    // 더보기
    @IBOutlet weak var tabButtonClickedMore: UIButton!
    // 개발자
    @IBOutlet weak var detailArtist: UILabel!
    // 평균 평점
    @IBOutlet weak var detailReviewAverage: UILabel!
    @IBOutlet weak var detailDescriptionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var downLoadButton: UIButton!
    
    
    var appStores: ITunes?
    
    var imageIconUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    func loadImage() {
        
        guard let urlString = imageIconUrl, let url = URL(string: urlString) else { return }
        let cacheKey = NSString(string: urlString)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            print("DetailViewController - iconImage ⭐️ 해당 이미지가 캐시이미지에 저장되어 있음")
            self.iconImageView.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                // 다운로드된 이미지를 캐시에 저장
                print("DetailViewController - iconImage - ❗️캐시 이미지에 이미지가 없다면 다운로드된 이미지를 캐시에 저장")
                ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                self.iconImageView.image = image
                
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController - \(String(describing: appStores))")
        iconImageView.layer.cornerRadius = 12
        setupDetailView()
        setupDetailImage()
        downLoadButton.layer.cornerRadius = 12
        setupImageSettingOPtion()
        
    }
    
    func setupDetailView() {
        AppLabel.text = appStores?.trackName
        descriptionLabel.text = appStores?.description
        imageIconUrl = appStores?.artworkUrl100
        reviewAverage.text = appStores?.averageRatingCount
        starReview.text = appStores?.averageRating
        //useAge.text = appStores?.trackContentRating
        chart.text = appStores?.categoryToString
        useAge.text = appStores?.trackContentRating
        chartList.text = appStores?.primaryGenreName
        artistPicture.image = UIImage(systemName: "person.crop.square")
        artistPicture.tintColor = .systemGray3
        artisName.text = appStores?.artistName
        languageCode.text = appStores?.languageCodesISO2A![0]
        languageCount.text = appStores?.languageCount
        detailDescription.text = appStores?.description
        detailArtist.text = appStores?.artistName
        detailArtist.textColor = UIColor.link
        detailReviewAverage.text = appStores?.averageRatingCount
        
    }
    
    // 이미지를 눌렀을때 터치 액션
    @objc func imageTapped() {
        print("이미지가 터치 되었습니다.")
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FullScreenImageViewController") as! FullScreenImageViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.fullScreenImageUrl = appStores?.screenshotUrls
        
        self.present(viewController, animated: true)
    }
    
    func setupDetailImage() {
        // URL(string: )으로 변환된 것을 담기 위한 빈 배열 생성
        var a1: [URL] = []
        
        // 옵셔널로 오기때문에 바인딩
        guard let screenshotUrls = appStores?.screenshotUrls else { return }
        
        for i in screenshotUrls {
            // 바인딩된 String -> URL(string: ) 으로 변환후 빈 배열에 담기
            a1.append(URL(string: i)!)
        }
        // a1에 appStores?.screenshotUrls에서 받아온 url이 쌓임 ex) 8개, 6개, 5개 ...
        // 근데 이미지뷰가 해당 url보다 작거나 많으면 인덱스 초과 미만 뜸 --> 고정으로 7개만 보여주자
        // url 배열 만들어짐
        print("URL 배열 \(a1)")
        print("URL의 갯수 : \(a1.count)")
        print("스샷콜렉션 갯수: \(screenShotCollection.count)")
        for j in 0..<a1.count {
            // a1[j]의 갯수 <= imageView의 갯수 가 될때만 실행하기
            // 왜냐하면 imageView의 갯수보다 URL의 갯수가 많으면 index 에러 발생
            if j <= screenShotCollection.count-1 {
                
                let cacheKey = NSString(string: screenshotUrls[j])
                // 하나씩 돌리면서 이미지 캐시 만들기
                if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
                    print("DetailViewController - setupDetailImage ⭐️ 해당 이미지가 캐시이미지에 저장되어 있음")
                    self.screenShotCollection[j].image = cachedImage
                    continue
                }
                
                
                
                DispatchQueue.global().async {
                    // 변환된 a1을 하나씩 넣어주며 data를 생성한다.
                    
                    guard let data = try? Data(contentsOf: a1[j]) else { return }
                    
                    DispatchQueue.main.async {
                        
                        guard let image = UIImage(data: data) else { return }

                        print("DetailViewController - DispatchQueue.global ❗️캐시 이미지에 이미지가 없다면 다운로드된 이미지를 캐시에 저장 ")

                        ImageCacheManager.shared.setObject(image, forKey: cacheKey)

                        self.screenShotCollection[j].image = image
                     
                    }
                }
            } else {
                // 배열의 갯수가 넘어간다면 Stop
                break
            }
        }
    }
    
    // main큐에서 작동하지 않아서 따로 함수를 만들어줌...
    // 원인은 152번째 continue로 추정..
    func setupImageSettingOPtion() {
        
        for index in 0..<screenShotCollection.count {
            // 각 ImageView에 cornerRadius 적용
            self.screenShotCollection[index].layer.cornerRadius = 12
            // 스토리보드에서 userInteractionEnalbed 체크해주고 true로 설정
            self.screenShotCollection[index].isUserInteractionEnabled = true
            // 이미지를 탭 제스처를 했을때 실행할 메서드
            self.screenShotCollection[index].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTapped)))
        }
       
    }

    /// 더보기 버튼을 눌렀을때 description창 늘어남
    @IBAction func tabButtonClicked(_ sender: UIButton) {
        
        self.detailDescriptionHeight.priority = .defaultHigh
        self.detailDescription.numberOfLines = 0
        self.detailDescriptionHeight.constant = 400
        self.view.layoutIfNeeded()
    }
    
    @IBAction func downLoadButtonClicked(_ sender: UIButton) {
        print("DetailViewController - 버튼이 눌렸습니다.")
    }
    
}


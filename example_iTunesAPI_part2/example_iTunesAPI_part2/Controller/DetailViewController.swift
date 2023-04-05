//
//  DetailViewController.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var AppLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var reviewAverage: UILabel!
    @IBOutlet weak var starReview: UILabel!
    
    @IBOutlet weak var useAge: UILabel!
    
    @IBOutlet weak var chart: UILabel!
    @IBOutlet weak var chartList: UILabel!
    
    @IBOutlet weak var artistPicture: UIImageView!
    @IBOutlet weak var artisName: UILabel!
    
    @IBOutlet weak var languageCode: UILabel!
    @IBOutlet weak var languageCount: UILabel!
  
    @IBOutlet var screenShotsCollection: [UIImageView]!
    
    var appStores: ITunes?
    
    var imageIconUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    func loadImage() {
        
        guard let urlString = imageIconUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.iconImageView.image = UIImage(data: data)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController - \(String(describing: appStores))")
        iconImageView.layer.cornerRadius = 12
        setupDetailView()
        for screenShot in screenShotsCollection {
            screenShot.backgroundColor = .green
        }
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
    }
    
//    var oneOfManyScreenShot: String? {
//        didSet {
//            setupLoadImage()
//        }
//    }
    
//    func setupLoadImage() {
//
//        guard let urlString = oneOfManyScreenShot, let url = URL(string: urlString) else { return }
//
//        DispatchQueue.global().async {
//            guard let data = try? Data(contentsOf: url) else { return }
//
//            guard urlString == url.absoluteString else { return }
//            DispatchQueue.main.async {
//                for screenShot in self.screenShotsCollection {
//                    screenShot.image = UIImage(data: data)
//                }
//            }
//        }
//    }
}

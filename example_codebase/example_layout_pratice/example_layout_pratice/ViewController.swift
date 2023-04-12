//
//  ViewController.swift
//  example_layout_pratice
//
//  Created by 염성필 on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Properties
    let mainTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 10)
        title.textColor = .gray
        title.text = "4월 12일 수요일"
        return title
    }()
    
    let todayTitle: UILabel = {
        let todayTitle = UILabel()
        todayTitle.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        todayTitle.text = "투데이"
        return todayTitle
    }()
    
    let personImageView: UIImageView = {
        let image = UIImage(named: "image123")
        //frame을 잡아주는 이유는 cornerRadius을 잡기 위해 설정해준다. width, height값은 heightAnchor의 값과 일치시킨다.
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageview.contentMode = .scaleAspectFill
        imageview.image = image
        imageview.backgroundColor = .red
        //imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = imageview.frame.height/2
        print(imageview.frame.height/2)
        imageview.clipsToBounds = true
        return imageview
    }()
    
    // 보라색 뷰
    let displayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemPink
        return view
    }()
    
    let viewInTitle: UILabel = {
        let title = UILabel()
        title.text = "더 깊이 보기"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 14)
        return title
    }()
    
    let viewInSubTitle: UILabel = {
        let title = UILabel()
        title.text = "디스라이트 공략 팁 5선"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        return title
    }()
    
    // 스택 뷰
    lazy var stackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [viewInTitle, viewInSubTitle])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .equalCentering
        stackview.spacing = 1
        return stackview
    }()
    
    // view안에 image
    let mainImage : UIImageView = {
        let imageview = UIImageView()
        let image = UIImage(named: "image456")
        imageview.image = image
        imageview.contentMode = .scaleToFill
        return imageview
    }()
    
    
    

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setup()
    }
    
    func setup() {
        view.addSubview(mainTitle)
        view.addSubview(todayTitle)
        view.addSubview(personImageView)
        view.addSubview(displayView)
        view.addSubview(stackView)
        view.addSubview(mainImage)
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        todayTitle.translatesAutoresizingMaskIntoConstraints = false
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        displayView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            todayTitle.leadingAnchor.constraint(equalTo: mainTitle.leadingAnchor),
            todayTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            personImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            personImageView.topAnchor.constraint(equalTo: todayTitle.topAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 30),
            personImageView.widthAnchor.constraint(equalToConstant: 30),
            displayView.topAnchor.constraint(equalTo: todayTitle.bottomAnchor, constant: 10),
            displayView.leadingAnchor.constraint(equalTo: todayTitle.leadingAnchor),
            displayView.trailingAnchor.constraint(equalTo: personImageView.trailingAnchor),
            displayView.heightAnchor.constraint(equalToConstant: 300),
            stackView.topAnchor.constraint(equalTo: displayView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: displayView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: displayView.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            mainImage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            mainImage.leadingAnchor.constraint(equalTo: displayView.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: displayView.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: displayView.bottomAnchor)
        ])
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



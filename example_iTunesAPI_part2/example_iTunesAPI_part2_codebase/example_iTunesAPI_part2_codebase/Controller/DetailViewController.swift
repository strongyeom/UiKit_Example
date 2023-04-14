//
//  DetailViewController.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/14.
//

import UIKit


class DetailViewController: UIViewController {

    
    // MARK: - Properties
    
    // scrollView
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    // UiView
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "예시입니다."
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return title
    }()
    
    let titleDescription: UILabel = {
        let title = UILabel()
        title.text = "법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. 대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다. 법관이 중대한 심신상의 장해로 직무를 수행할 수 없을 때에는 법률이 정하는 바에 의하여 퇴직하게 할 수 있다. 모든 국민은 신체의 자유를 가진다. 누구든지 법률에 의하지 아니하고는 체포·구속·압수·수색 또는 심문을 받지 아니하며, 법률과 적법한 절차에 의하지 아니하고는 처벌·보안처분 또는 강제노역을 받지 아니한다. 국회의원의 선거구와 비례대표제 기타 선거에 관한 사항은 법률로 정한다. 정당의 설립은 자유이며, 복수정당제는 보장된다.법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. 대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다. 법관이 중대한 심신상의 장해로 직무를 수행할 수 없을 때에는 법률이 정하는 바에 의하여 퇴직하게 할 수 있다. 모든 국민은 신체의 자유를 가진다. 누구든지 법률에 의하지 아니하고는 체포·구속·압수·수색 또는 심문을 받지 아니하며, 법률과 적법한 절차에 의하지 아니하고는 처벌·보안처분 또는 강제노역을 받지 아니한다. 국회의원의 선거구와 비례대표제 기타 선거에 관한 사항은 법률로 정한다. 정당의 설립은 자유이며, 복수정당제는 보장된다"
        title.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        title.numberOfLines = 0
        return title
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScroll()
    }
    
    func setupScroll() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleDescription)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        
        
//        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
//        contentViewHeight.priority = .defaultLow
//        contentViewHeight.isActive = true
//
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1500),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            titleDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleDescription.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        
        ])
        
    }
    
}

//
//  CustomCalendarViewController.swift
//  example_CustomCalendar
//
//  Created by 염성필 on 2023/04/17.
//

import UIKit

class CustomCalendarViewController: UIViewController {
    
    
    // MARK: - Properties

    
    // MARK: - 년, 월 ( 메인 타이틀 )
    var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        title.text = "2023년 01월"
        title.textColor = .label
        return title
    }()
    
    
    // MARK: - 이전 달, 다음달로 이동 버튼
    var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    
    // MARK: - today 버튼
    var todayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Today", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - 요일 Label
    var monLabel: UILabel = {
        let title = UILabel()
        title.text = "월"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    var tusLabel: UILabel = {
        let title = UILabel()
        title.text = "화"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    var wedLabel: UILabel = {
        let title = UILabel()
        title.text = "수"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    var thsLabel: UILabel = {
        let title = UILabel()
        title.text = "목"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    var friLabel: UILabel = {
        let title = UILabel()
        title.text = "금"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    var satLabel: UILabel = {
        let title = UILabel()
        title.text = "토"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    var sunLabel: UILabel = {
        let title = UILabel()
        title.text = "일"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    // MARK: - StackView
    lazy var weekStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sunLabel, monLabel, tusLabel, wedLabel, thsLabel, friLabel, satLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    // MARK: - CollectionView
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    
    func configure() {
        configureTitleLabel()
        configurePreviousButton()
        configureNextButton()
        configureTodayButton()
        configureStackView()
        configureCollectionView()
    }
    
    // MARK: - Title 레이아웃
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configurePreviousButton() {
        view.addSubview(previousButton)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            previousButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10),
            previousButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            previousButton.heightAnchor.constraint(equalToConstant: 44),
            previousButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            nextButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 44),
            nextButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureTodayButton() {
        view.addSubview(todayButton)
        todayButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            todayButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            todayButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func configureStackView() {
        view.addSubview(weekStackView)
        weekStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weekStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            weekStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            weekStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Cell을 register 사용해서 연결
        collectionView.register(CustomCalCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CustomCalCollectionViewCell.self))
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: weekStackView.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: weekStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: weekStackView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.5)
        
        ])
    }
}

extension CustomCalendarViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Cell의 갯수를 보여주기 위해 임의로 값을 설정
        return 35
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cell 구현
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCalCollectionViewCell.self), for: indexPath) as! CustomCalCollectionViewCell
        return cell
    }
}


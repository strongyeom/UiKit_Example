//
//  CustomCalendarViewController.swift
//  example_CustomCalendar
//
//  Created by 염성필 on 2023/04/17.
//

import UIKit

class CustomCalendarViewController: UIViewController {
    
    
    // MARK: - Properties
    
    // user의 현재 달력
    private let calendar = Calendar.current
    // 입력되는 날짜를 형 변형 시키기위해 DateFormatter() 객체 생성
    private let dateFormatter = DateFormatter()
    // Date() 를 생성해서 현재 시간과 날짜 가져오기
    private var calendarDate = Date()
    // 빈 배열을 만들어주고 만들어진 날짜 day(일) 넣기
    private var days: [String] = []
    
    // MARK: - 년, 월 ( 메인 타이틀 )
    var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        title.text = ""
        title.textColor = .label
        return title
    }()
    
    
    // MARK: - 이전 달, 다음달로 이동 버튼
    var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(previousButtonClicked), for: .touchUpInside)
        return button
    }()
    
    var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(todayButtonClicked), for: .touchUpInside)
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
        configureCalendar()
    }
    
    // MARK: - Action Method
    @objc func previousButtonClicked() {
        minusMonth()
    }
    @objc func nextButtonClicked() {
        plusMonth()
    }
    @objc func todayButtonClicked() {
        today()
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


// MARK: - UICollectionViewDataSource
extension CustomCalendarViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Cell의 갯수를 보여주기 위해 임의로 값을 설정
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cell 구현
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCalCollectionViewCell.self), for: indexPath) as! CustomCalCollectionViewCell
        // 배열로 만들어진 String들을 dayLabel.text에 하나씩 넣어줍니다.
        cell.dayLabel.text = days[indexPath.item]
        return cell
    }

    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension CustomCalendarViewController: UICollectionViewDelegateFlowLayout {
    
    // Cell의 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 요일 스택뷰의 크기에 맞게 7의 크기로 나눕니다.
        let width = weekStackView.frame.width/7
        return CGSize(width: width, height: width * 1.3)
    }
    
    // Cell과의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

// MARK: - CustomCalendarViewController
extension CustomCalendarViewController {
    
    func configureCalendar() {
        // 메인 타이틀을 어떤 형식으로 보여줄지 형 변형
        dateFormatter.dateFormat = "yyyy년 MM월"
        // dateComponents : 표준 시간대를 사용하여 Calendar의 모든 날짜 구성요소를 반환
        today()
    }
    
    // component()를 이용하면 1일은 일요일, 7은 토요일로 반환됩니다.
    // days 배열의 0번 인덱스를 일요일로 표시해주기 위하여 -1를 해준후 반환합니다.
    func startDayOftheWeek() -> Int {
        print("startDayOftheWeek(): ", calendar.component(.weekday, from: calendarDate)-1)
        return calendar.component(.weekday, from: calendarDate)-1
    }
    
    // 해당 달에 몇일까지 있는지 확인후 일수를 반환합니다.
    func endDate() -> Int {
        return calendar.range(of: .day, in: .month, for: calendarDate)?.count ?? Int()
    }
    
    // dateFormatter를 이용하여 calendarDate를 설정한것 Maintitle에 적용시킵니다.
    func updateTitle() {
        // calendarDate의 자료형이 Date이기 때문에 자료형 -> String으로 변환
        let date = dateFormatter.string(from: calendarDate)
        titleLabel.text = date
        print(titleLabel.text ?? "")
    }
    
    // updatDay()가 불렸을때는 이전 데이터가 필요 없어지고 새로운 해당 달의 일수만 보여주는 메서드
    func updateDay() {
        // 해당 메서드가 불려지만 빈배열로 만듭니다.
        self.days = []
        // 해당 요일의 시작 인덱스를 정해주고
        let startOftheWeek = startDayOftheWeek()
        // 시작 일수와 + 해당 달의 일수를 더해줍니다.
        let totalDay = startOftheWeek + endDate()
        
        for day in Int()..<totalDay {
            if day < startOftheWeek {
                days.append(String())
                continue
            }
            self.days.append("\(day - startOftheWeek + 1)")
        }
        collectionView.reloadData()
    }
    
    // 타이틀과 날짜(일)를 업데이트해주는 메서드입니다.
    func updateCalendar() {
        updateTitle()
        updateDay()
    }
    
    // 이전 달로 가는 메서드
    func minusMonth() {
        // date(byAdding: ~ ) 지정된 날짜에 구성요소를 추가하여 계산된 날짜를 반환 메소드
        calendarDate = calendar.date(byAdding: DateComponents(month: -1), to: calendarDate) ?? Date()
        updateCalendar()
    }
    
    // 다음 달로 가는 메서드
    func plusMonth() {
        // date(byAdding: ~ ) 지정된 날짜에 구성요소를 추가하여 계산된 날짜를 반환 메소드
        calendarDate = calendar.date(byAdding: DateComponents(month: 1), to: calendarDate) ?? Date()
        updateCalendar()
    }
    
    func today() {
        // dateComponents : 표준 시간대를 사용하여 Calendar의 모든 날짜 구성요소를 반환
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        // date : 지정된 구성 요소에서 생성된 날짜를 반환
        calendarDate = calendar.date(from: components) ?? Date()
        // Calendar를 업데이트 해줍니다.
        updateCalendar()
    }
    
    
}

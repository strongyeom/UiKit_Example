/*
 
 🔴 현재 달력 가져오기
 static var current: Calendar
 
 🔴 모든 날짜 구성 요소 반환 : 달력 표준 시간대를 사용하여 Calendar의 모든 날짜 구성 요소를 반환합니다.
 func dateComponents(Set<Calendar.Component>, from: Date) -> DateComponents
 
 ex) calendar.dateComponents([.year, .month, .day], from: Date())  ==> year: 2023 month: 4 day: 17
 
 🔴 날짜 생성 : 지정된 구성 요소에서 생성된 날짜를 반환합니다.
 func date(from: DateComponents) -> Date?
 
 ex) calendar.date(from: .year) ==> "Jan 1, 2023 at 12:00 AM" : .year만 넣으면 2023년 1월 1일 이런식으로 구성 요소를 제외한 나머지를 초기화시켜 생성된 날짜를 반환
 
     calendar.date(from: .month) ==> "Apr 1, at 12:00 AM"
 
 🔴 구성 요소에 대한 값 반환 : 날짜의 한 구성 요소에 대한 값을 반환합니다.
 func component(Calendar.Component, from: Date) -> Int
 
 ex) calendar.component(.year, from: Date()) ==> 2021 : .year를 넣어주면 from에서 year만 뽑아 Int 타입으로 출력
     calendar.component(.weekday, from: Date()) ==> 7 : .weekday를 넣어주면 from에서 현재 요일을 1은 일요일, 7은 토요일로 출력
 
 🔴 절대 시간의 값의 범위 반환 : 지정된 절대 시간을 포함하는 큰 달력 구성요소(예:월)에서 작은 구성요소(예:일)가 취할 수있는 절대 시간 값의 범위를 반환합니다.
                          즉, for : 날짜가 속한, in: 달에서, of: 일이 취할 수있는 범위를 계산
 
 func range(of: Calendar.Component, in: Calendar.Component, for: Date) -> Range?
 
 ex) calendar.range(of: .day, in: .month, for: Date()) ==> 2023.04.17 일때, 2023.04.17이 속한 4월에 속한 일 수 계산
 즉, 반환값을 1..<31이 됨. 1일부터 30일까지 있음
 
 🔴 날짜 계산 : 지정된 날짜에 구성요소를 추가하여 계산된 날짜를 반환
 func date(byAdding: DateComponents, to: Date, wrappingComponents: Bool) -> Date?
 
 ex) calendar.dateComponents([.month, .day, .year], from: Date()) ==> year: 2023, month: 4, day: 17
     calendar.date(byAdding: DateComponents(month:1, day: -1), to: Date()) ==> 2023.05.16 : month +1, day -1을 적용
 
 */
import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var previousButton = UIButton()
    private lazy var nextButton = UIButton()
    private lazy var todayButton = UIButton()
    private lazy var weekStackView = UIStackView()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    private var calendarDate = Date()
    private var days: [String] = []
    
   
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configure()
    }
    
    func configure() {
        configureScrollView()
        configureContentView()
        configureTitleLabel()
        configurePreviousBuutton()
        configureNextBuutton()
        configureTodayBuutton()
        configureWeekStackView()
        configureWeekLabel()
        configureCollectionView()
        configureCalendar()
    }
    
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
    func configureContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "2000년 01월"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        
        ])
    }
    
    func configurePreviousBuutton() {
        contentView.addSubview(previousButton)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.tintColor = .label
        previousButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        previousButton.addTarget(self, action: #selector(didPreviousButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            previousButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            previousButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -5),
            previousButton.widthAnchor.constraint(equalToConstant: 44),
            previousButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureNextBuutton() {
        contentView.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.tintColor = .label
        nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        nextButton.addTarget(self, action: #selector(didNextButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            nextButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            nextButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            nextButton.widthAnchor.constraint(equalToConstant: 44),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureTodayBuutton() {
        contentView.addSubview(todayButton)
        todayButton.translatesAutoresizingMaskIntoConstraints = false
        todayButton.setTitle("Today", for: .normal)
        todayButton.setTitleColor(.systemBackground, for: .normal)
        todayButton.backgroundColor = .label
        todayButton.layer.cornerRadius = 5
        todayButton.addTarget(self, action: #selector(didTodayButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            todayButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            todayButton.leadingAnchor.constraint(equalTo: nextButton.trailingAnchor, constant: 10),
            todayButton.widthAnchor.constraint(equalToConstant: 60),
            todayButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureWeekStackView() {
        contentView.addSubview(weekStackView)
        weekStackView.translatesAutoresizingMaskIntoConstraints = false
        weekStackView.distribution = .fillEqually
        weekStackView.axis = .horizontal
        
        NSLayoutConstraint.activate([
            weekStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            weekStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            weekStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    func configureWeekLabel() {
        let dayOfTheWeek = ["일","월","화","수","목","금","토"]
        
        for i in 0..<dayOfTheWeek.count {
            let label = UILabel()
            label.text = dayOfTheWeek[i]
            label.textAlignment = .center
            weekStackView.addArrangedSubview(label)
            
            if i == 0 {
                label.textColor = .systemRed
            } else {
                label.textColor = .systemBlue
            }
        }
    }
    
    func configureCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CalendarCollectionViewCell.self))
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: weekStackView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: weekStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: weekStackView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1.5)
        
        ])
    }
    
    func configureCalendar() {
        
        dateFormatter.dateFormat = "yyyy년 MM월"
        today()
    }
    
    func today() {
        let components = calendar.dateComponents([.year, .month], from: Date())
        calendarDate = calendar.date(from: components) ?? Date()
        updateCalendar()
    }
    
    func startDayOfTheWeek() -> Int {
        return calendar.component(.weekday, from: self.calendarDate) - 1
    }
    
    func endDate() -> Int {
        return self.calendar.range(of: .day, in: .month, for: self.calendarDate)?.count ?? Int()
    }
    
    func updateTitle() {
        let date = self.dateFormatter.string(from: self.calendarDate)
        self.titleLabel.text = date
    }
    
    func updateDays() {
        self.days.removeAll()
        let startDayOfTheWeek = self.startDayOfTheWeek()
        let totalDays = startDayOfTheWeek + self.endDate()
        
        for day in Int()..<totalDays {
            if day < startDayOfTheWeek {
                days.append(String())
                continue
            }
            self.days.append("\(day - startDayOfTheWeek + 1)")
        }
        collectionView.reloadData()
    }
    
    func updateCalendar() {
        self.updateTitle()
        self.updateDays()
    }
    
    func minusMonth() {
        self.calendarDate = self.calendar.date(byAdding: DateComponents(month: -1), to: self.calendarDate) ?? Date()
        self.updateCalendar()
    }
    
    func plusMonth() {
        self.calendarDate = self.calendar.date(byAdding: DateComponents(month: 1), to: self.calendarDate) ?? Date()
        self.updateCalendar()
    }
    
    @objc func didPreviousButtonTapped() {
        print("이전 버튼이 눌렸습니다.")
        minusMonth()
    }
    
    @objc func didNextButtonTapped() {
        print("다음 버튼이 눌렸습니다.")
        plusMonth()
    }
    
    @objc func didTodayButtonTapped() {
        print("오늘 버튼이 눌렸습니다.")
        today()
    }
    
    
    
    
    
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CalendarCollectionViewCell.self), for: indexPath) as! CalendarCollectionViewCell
        cell.update(day: days[indexPath.item])
        return cell
    }
    

    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = weekStackView.frame.width / 7
        return CGSize(width: width, height: width * 1.3)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return .zero
    }
    
}



import UIKit

class CustomCalCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    // 라벨 배경
    var labelBg: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = backgroundView.frame.width/2
        backgroundView.clipsToBounds = true
        backgroundView.layer.opacity = 1.0
        return backgroundView
    }()
    
    // 라벨
    var dayLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 20)
        return title
    }()
    
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.addSubview(dayLabel)
        self.addSubview(labelBg)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        labelBg.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            labelBg.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 10),
//            labelBg.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
//            labelBg.trailingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            labelBg.widthAnchor.constraint(equalToConstant: 10),
            labelBg.heightAnchor.constraint(equalToConstant: 10),
            labelBg.centerXAnchor.constraint(equalTo: dayLabel.centerXAnchor)
            
        ])
    }
}

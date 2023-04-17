
import UIKit

class CustomCalCollectionViewCell: UICollectionViewCell {
    
    var dayLabel: UILabel = {
        let title = UILabel()
        title.text = "1"
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}

//
//  CodePresentViewController.swift
//  example_transition
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit

// 데이터를 주는 쪽에서 프로토콜을 정의한다.
protocol CodePresentDelegate: AnyObject {
    func text(text: String)
}

// MARK: Code로 Present
class CodePresentViewController: UIViewController {
    
    // delegate 속성 만들어주기
    weak var delegate: CodePresentDelegate?
    var text: String?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var nameLabel: UILabel!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let text = text {
//            nameLabel.text = text
//        }
      
        
       
        
    }
    @IBAction func tabBackButton(_ sender: UIButton) {
        delegate?.text(text: textField.text ?? "")
        dismiss(animated: true)
    }
 
}

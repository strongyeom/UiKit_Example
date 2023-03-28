//
//  SeguePresentViewController.swift
//  example_transition
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit

// MARK: action Segue ( present )
class SeguePresentViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = text {
            nameLabel.text = text
        }
    }
    
    /// Segue_present로 연결 되어 있을때는 dismiss 메소드를 이용하면 된다.
    @IBAction func tabBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

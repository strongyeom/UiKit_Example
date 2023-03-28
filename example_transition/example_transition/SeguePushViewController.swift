//
//  SeguePushViewController.swift
//  example_transition
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit

// MARK: action_Segue ( push )
class SeguePushViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    var seguePushtext: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let seguePushtext = seguePushtext {
            nameLabel.text = seguePushtext
        }
    }

    /// 현재 Navigation의 Segue의 push를 사용하고 있기때문에 pop을 사용하여 dismiss할 수 있다.
    @IBAction func tabBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        // VC가 많을때 RootVC로 한번에 이동하려면
        //navigationController?.popToRootViewController(animated: true)
    }
}

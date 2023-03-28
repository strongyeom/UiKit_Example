//
//  CodePushViewController.swift
//  example_transition
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit


// MARK: Code로 Push
class CodePushViewController: UIViewController {

    
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

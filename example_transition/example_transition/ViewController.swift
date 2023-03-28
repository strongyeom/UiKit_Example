//
//  ViewController.swift
//  example_transition
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func codePushButton(_ sender: UIButton) {
        // 인스턴스화 하기
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as! CodePushViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func codePresentButton(_ sender: UIButton) {
        let viewController = self.storyboard
    }
    
}


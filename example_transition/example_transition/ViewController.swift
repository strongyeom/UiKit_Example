//
//  ViewController.swift
//  example_transition
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit


// 데이터를 받는 쪽에서 프로토콜을 구현한다.
class ViewController: UIViewController, CodePresentDelegate {
    

    
    @IBOutlet var seguePushLabel: UILabel!
    @IBOutlet weak var seguePushTextField: UITextField!
    
    @IBOutlet weak var seguePresentLabel: UILabel!
    @IBOutlet weak var seguePresentTextField: UITextField!
    
    
    @IBOutlet weak var codePushLabel: UILabel!
    @IBOutlet weak var codePushTextField: UITextField!
    
    @IBOutlet weak var codePresentLabel: UILabel!
    @IBOutlet weak var codePresentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }

    @IBAction func codePushButton(_ sender: UIButton) {
        // 인스턴스화 하기
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as! CodePushViewController
        viewController.text = codePushTextField.text ?? ""
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func codePresentButton(_ sender: UIButton) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as! CodePresentViewController
        viewController.modalPresentationStyle = .fullScreen
        // self: 데이터를 받는 ViewController
        viewController.delegate = self
        present(viewController, animated: true)
    }
    
    // Segue로 연결됐을때 prepare 이용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewControllerSeguePush = segue.destination as! SeguePushViewController
        viewControllerSeguePush.seguePushtext = seguePushTextField.text ?? ""
    }
    
    /// 프로토콜을 채택하면 필수 메소드를 만들어준다.
    func text(text: String) {
        codePresentLabel.text = text
        print("\(text)")
    }
    
}


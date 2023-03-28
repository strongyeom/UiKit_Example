//
//  AddViewController.swift
//  example_Todo_1
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet var textField: UITextField!
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = text {
            textField.text = text
        }
    }
    
    @IBAction func tabSaveBuuton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

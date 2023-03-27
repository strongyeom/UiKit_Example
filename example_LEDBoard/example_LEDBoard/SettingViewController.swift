//
//  SettingViewController.swift
//  example_LEDBoard
//
//  Created by 염성필 on 2023/03/27.
//

import UIKit


protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, bgColor: UIColor)
    
}



class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purplrButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    
    weak var delegate: LEDBoardSettingDelegate?
    // 초기값 설정
    var textColor: UIColor = .yellow
    var bgColor: UIColor = .black
    
    var ledText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        if let ledText = ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBgColor(color: self.bgColor)
    }
   
    
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        // 어떤 버튼이 선택되었는지 알아야함
        if sender == self.yellowButton {
            self.textColor = .yellow
            self.changeTextColor(color: .yellow)
        } else if sender == self.purplrButton {
            self.textColor = .purple
            self.changeTextColor(color: .purple)
        } else {
            self.textColor = .green
            self.changeTextColor(color: .green)
        }
    }
    
    
    @IBAction func tabBackgroundColorButton(_ sender: UIButton) {
        // 어떤 버튼이 선택되었는지 알아야함
        if sender == self.blackButton {
            self.bgColor = .black
            self.changeBgColor(color: .black)
        } else if sender == self.blueButton {
            self.bgColor = .blue
            self.changeBgColor(color: .blue)
        } else {
            self.bgColor = .orange
            self.changeBgColor(color: .orange)
        }
    }
    
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(text: self.textField.text, textColor: self.textColor, bgColor: self.bgColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    // 선택된것의 텍스트 알파값 변경 메소드
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purplrButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    // 선택된것의 배경색상 알파값 변경 메소드
    private func changeBgColor(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
    

}

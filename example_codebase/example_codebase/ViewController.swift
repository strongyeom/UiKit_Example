//
//  ViewController.swift
//  example_codebase
//
//  Created by 염성필 on 2023/04/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var someViewBottomConstraint: NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView()")
        
        let someView = UIView()
        someView.backgroundColor = UIColor(named: "MyBlue")
        someView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someView)
        someView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            someView.widthAnchor.constraint(equalToConstant: 100),
            someView.heightAnchor.constraint(equalToConstant: 50),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            someView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        someViewBottomConstraint = NSLayoutConstraint(item: someView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        someViewBottomConstraint?.isActive = true
        someViewBottomConstraint?.constant = 0
        
        
        let moveViewUpBtn = UIButton(type: .system)
        moveViewUpBtn.translatesAutoresizingMaskIntoConstraints = false
        moveViewUpBtn.backgroundColor = .white
        moveViewUpBtn.setTitle("위로 올리기", for: .normal)
        moveViewUpBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        moveViewUpBtn.setTitleColor(.black, for: .normal)
        moveViewUpBtn.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        moveViewUpBtn.layer.cornerRadius = 8
        moveViewUpBtn.addTarget(self, action: #selector(moveViewUp), for: .touchUpInside)
        view.addSubview(moveViewUpBtn)
        
        moveViewUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        moveViewUpBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        
        
    }
    
    @objc fileprivate func moveViewUp() {
        print("ViewController - moveViewUp()")
        someViewBottomConstraint?.constant -= 100
        self.view.layoutIfNeeded()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad()")
        view.backgroundColor = UIColor(named: "MyYellow")
    }
}

#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}


struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif

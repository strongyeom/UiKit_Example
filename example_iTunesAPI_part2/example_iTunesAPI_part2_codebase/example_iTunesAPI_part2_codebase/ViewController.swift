//
//  ViewController.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    // UIView의 속성들 - 메모리에 올라가는 순간 클로저 실행, 세팅의 리턴값을 emailTextFieldView에 넣어줌
    let emailTextFieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = .red
        return view
    }()
    
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        
        tableViewSetting()
    }
    
    func tableViewSetting() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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



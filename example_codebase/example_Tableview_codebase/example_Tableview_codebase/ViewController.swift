//
//  ViewController.swift
//  example_Tableview_codebase
//
//  Created by 염성필 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    // UIView의 속성들 - 메모리에 올라가는 순간 클로저 실행, 세팅의 리턴값을 emailTextFieldView에 넣어줌
    
    let tableview: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    var titlearray = [
    "123", "12 5433", " dasdas", "fdmfksdlf"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(tableview)
        setupTableView()
    }
    
    func setupTableView() {
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        
        // Nib파일 register 하기
        tableview.register(TableViewCell.self, forCellReuseIdentifier: String(describing: TableViewCell.self))
        // view에 tableView 레이아웃 설정
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as! TableViewCell
        cell.title.text = titlearray[indexPath.row]
        return cell
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



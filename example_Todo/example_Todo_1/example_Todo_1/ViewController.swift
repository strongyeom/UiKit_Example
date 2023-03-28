//
//  ViewController.swift
//  example_Todo_1
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var tasks: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabAddButton(_ sender: UIBarButtonItem) {
        
    }
    
    // Segue로 데이터 전달시
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddViewController {
            guard let text = viewController.textField?.text else { return }
            let addText = Task(title: text)
            tasks.append(addText)
            debugPrint(tasks)
            tableView.reloadData()
        }
    }
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // 전환하려는 vc의 데이터의 정보를 가져올 수 있음
         if let viewController = segue.destination as? SeguePushViewController {
             //Segue vc에 접근
             viewController.name = "sddffffd"
         }
     }
     */
    
    
    
    @IBAction func tabEditButton(_ sender: UIBarButtonItem) {
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
}

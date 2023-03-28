//
//  ViewController.swift
//  example_Todo
//
//  Created by 염성필 on 2023/03/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    var tasks: [Task] = [] {
        // 하나씩 배열안에 append 될때마다 didSet을 실행
        didSet {
            // 추가 될때마다 userDefaults에 저장됨
            self.saveTasks()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // 데이터 로드
        self.loadTasks()
        
    }
    
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(true, animated: true)
    }

    @IBAction func tabEditButton(_ sender: UIBarButtonItem) {
        
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    
    @IBAction func tabAddButton(_ sender: UIBarButtonItem) {
        
        // 알럿 코드
        let alert = UIAlertController(title: "할일 등록", message: nil, preferredStyle: .alert)
        let  registerButton = UIAlertAction(title: "등록", style: .default) { [weak self]_ in
            // 클로져: 등록 버튼을 눌렀을때 어떤 액션을 실행할것인지
            // optional로 나오기때문에 guard let으로 바인딩
            
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            // 테이블 뷰를 갱신하여 테이블뷰에 보여지게 하기 위해서 reloadData 메소드
            self?.tableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        // alert에 텍스트 필드 추가
        alert.addTextField {  textField in
            // 텍스트 필드 설정
            textField.placeholder = "할 일을 입력해주세요"
        }
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func saveTasks() {
        let data = self.tasks.map {
            // map을 사용해서 딕셔너리 형태 만들기
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        // userDefaults 저장
        userDefaults.set(data, forKey: "tasks")
    }
    
    // 할 일을 로드
    func loadTasks() {
        //userDefaults에 접근
        let userDefaults = UserDefaults.standard
        // userDefaults 불러오기
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        // 딕셔너리를 다시 배열로 전환
        self.tasks = data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
        
    }
    
}

extension ViewController: UITableViewDataSource {
    // 각 세션에 표시할 행의 갯수를 묻는 메서드 numberOfSection ~
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    // 특정 인덱스 Row의 Cell에 대한 정보를 넣어 Cell를 반환하는 메서드 CellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 스토리보드에서 구현된 Cell을 테이블뷰에 표시
        // dequeueReusableCell : 재사용하고 테이블뷰에 구현 ( 큐를 사용해서 재사용 ) -> 이유 : 메모리 낭비를 방지하기 위해서
        // ex) 내가 볼 수 있는 화면에만 일단 보여주고 스크롤하면 점점 더 많이 불러오는 방식
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // cell 위치 나타냄 [ 0 , tasks.count갯수만큼 ]
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    // cell이 테이블뷰에서 삭제, 스와이프 delete로 cell 삭제 가능
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty {
            self.doneButtonTap()
        }
    }
    
    // 편집모드에서 재정렬
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 편집모드에서 재정렬
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
    
}

extension ViewController: UITableViewDelegate {
    // 어떤 cell이 클릭이 되었는지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        // 선택된 cell만 reload
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
        
    }
}

























//delegate : 테이블 뷰의 시각적인 부분을 설정하고, 행의 액션 관리, 엑세러비 뷰 지원 그리고 테이블 뷰의 개별 행 편집을 도와줌


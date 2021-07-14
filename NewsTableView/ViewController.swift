//
//  ViewController.swift
//  NewsTableView
//
//  Created by David Yoon on 2021/07/14.
//
// new API key is: 05409300ee7a4b688b07cd7985890cd9
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    // 데이터가 몇개인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    // 데이터가 무엇인지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "myCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell //다시 재사용할 수 있는 셀은 재정의 해서 테이블 뷰에 넣는다.
        
        cell.lblMyCell.text = String(indexPath.row)
        // as? 맞으면 형변환 as! 강제로  형변환 MyCell : UITableViewCell
        //cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self // 클래스안에 func 들
        
    }

    // 1. 데이터가 무엇인지
    // 2. 데이터가 몇개인지
    
    // 행이 선택될때 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked !!  \(indexPath.row)")
    }
}


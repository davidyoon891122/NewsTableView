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
    
    var newsData: Array<Dictionary<String, Any>>?
    
    // 데이터가 몇개인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let news = newsData{
            return news.count
        } else {
            return 0
        }
    }
    
    // 데이터가 무엇인지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "myCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell //다시 재사용할 수 있는 셀은 재정의 해서 테이블 뷰에 넣는다.
        let idx = indexPath.row
        if let news = newsData {
            let row = news[idx]
            if let value = row as? Dictionary<String,Any> {
                if let title = value["title"] as? String{
                    cell.lblMyCell.text = title
                }
                
            }
        }
        
//        cell.lblMyCell.text = String(indexPath.row)
        // as? 맞으면 형변환 as! 강제로  형변환 MyCell : UITableViewCell
        //cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self // 클래스안에 func 들
        getNews()
        
    }

    // 1. 데이터가 무엇인지
    // 2. 데이터가 몇개인지
    
    // 행이 선택될때 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked !!  \(indexPath.row)")
    }
    
    
    
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=05409300ee7a4b688b07cd7985890cd9")!) { data, response, error in
            if let dataJson = data {
                //JSON으로 데이터 parsing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
                    self.newsData = articles
                    //네트워크 통신은 메인에서 화면 그리게 올려주어야 한다
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
                catch {}
            }
        }
        
        task.resume()
    }
}


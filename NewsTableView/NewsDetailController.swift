//
//  NewsDetailController.swift
//  NewsTableView
//
//  Created by David Yoon on 2021/07/15.
//

import UIKit

class NewsDetailController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblText: UILabel!
    
    //1. image URL
    //2. description
    
    var imageURL: String?
    var desc: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = imageURL {
            // 이미지 가져와서 띄워준다
            // Data
            if let data = try? Data(contentsOf: URL(string: img)!){ //Data는 백그라운드이기 때문에 Dispatch로 메인에 보내줘야함
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
                
            }
            
            
        }
        
        if let descText = desc {
            // 본문 보여줌
            self.lblText.text = descText
        }
    }
}

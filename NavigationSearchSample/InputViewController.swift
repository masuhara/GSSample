//
//  InputViewController.swift
//  NavigationSearchSample
//
//  Created by Masuhara on 2017/03/20.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets = [String]()
    
    @IBOutlet weak var timelineTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineTableView.dataSource = self
        timelineTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの中身を決めるコード
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        
        let userImageView = cell?.viewWithTag(1) as! UIImageView
        let userNameLabel = cell?.viewWithTag(2) as! UILabel
        let userTweetLabel = cell?.viewWithTag(3) as! UITextView
        
        userImageView.image = UIImage(named: "taro.jpg")
        userNameLabel.text = "Taro"
        userTweetLabel.text = "デブ、ロン毛"
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    
    
    
    
    
    
}



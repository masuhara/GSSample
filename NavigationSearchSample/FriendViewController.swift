//
//  FriendViewController.swift
//  NavigationSearchSample
//
//  Created by Masuhara on 2017/03/20.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit
import NCMB

class FriendViewController: UIViewController, UITableViewDataSource {
    
    // サーバーから貰ってきたデータを入れとく変数
    var friendInfo = [NCMBObject]()
    
    @IBOutlet weak var friendTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        friendTableView.dataSource = self
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        let nameLabel: UILabel = cell?.viewWithTag(1) as! UILabel
        let foodLabel: UILabel = cell?.viewWithTag(2) as! UILabel
        let likeLabel: UILabel = cell?.viewWithTag(3) as! UILabel
        
        nameLabel.text = friendInfo[indexPath.row].object(forKey: "userName") as? String
        foodLabel.text = friendInfo[indexPath.row].object(forKey: "foodName") as? String
        likeLabel.text = friendInfo[indexPath.row].object(forKey: "like") as? String
        return cell!
    }
    
    func loadData() {
        let query = NCMBQuery(className: "Food")
        query?.whereKey("userName", notEqualTo: "Yukako")
        query?.findObjectsInBackground({ (result, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.friendInfo = result as! [NCMBObject]
                self.friendTableView.reloadData()
            }
        })
    }
    
    @IBAction func reload() {
        loadData()
    }
}







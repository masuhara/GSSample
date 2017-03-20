//
//  AddViewController.swift
//  NavigationSearchSample
//
//  Created by Masuhara on 2017/03/20.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit
import NCMB

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var likeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        likeLabel.text = ""
        
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func likeButton() {
        likeLabel.text = "好き"
    }
    
    @IBAction func dislikeButton() {
        likeLabel.text = "嫌い"
    }
    
    @IBAction func allergyButton() {
        likeLabel.text = "アレルギー"
    }
    
    
    @IBAction func register() {
        // NCMBのサーバーに保存
        let object = NCMBObject(className: "Food")
        object?.setObject("Daisuke", forKey: "userName")
        object?.setObject(likeLabel.text, forKey: "like")
        object?.setObject(nameTextField.text, forKey: "foodName")
        object?.saveInBackground({ (error) in
            if error != nil {
                // エラー
                print(error!.localizedDescription)
            } else {
                // 保存完了
                print("保存完了")
            }
        })
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


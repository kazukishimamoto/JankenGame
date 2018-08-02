//
//  ViewController.swift
//  JankenGame
//
//  Created by shima on 2018/08/02.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    var answerNumber = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
        if answerNumber == 0{
            answerImageView.image = UIImage(named: "gu_kai")
            answerLabel.text = "ぐー！"
        } else if answerNumber == 1 {
            answerImageView.image = UIImage(named: "choki_kai")
            answerLabel.text = "ちょき！"
        } else {
            answerImageView.image = UIImage(named: "pa_kai")
            answerLabel.text = "ぱー"
        }
        
        answerNumber = answerNumber + 1
    }
}


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
    
    @IBOutlet weak var guButton: UIButton!
    @IBOutlet weak var chokiButton: UIButton!
    @IBOutlet weak var paButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var answerNumber = 0
    var selectStrategy :Int?
    var startFlag = 0
    
    @IBAction func jankenStartButton(_ sender: Any) {
        if selectStrategy == nil {
            startFlag = 1
            answerLabel.text = "じゃんけん...（出し手を選択）"
            startButton.setTitle("", for: .normal)
        } else if selectStrategy != nil{
            startFlag = 1
            answerLabel.text = "じゃんけん...（出し手を選択）"
            answerImageView.image = nil
            guButton.backgroundColor = UIColor.clear
            chokiButton.backgroundColor = UIColor.clear
            paButton.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func selectGuButton(_ sender: Any) {
        if startFlag == 1 {
            guButton.backgroundColor = UIColor.brown
            selectStrategy = 0
            answerLabel.text = shuffleAction(strategy: selectStrategy!)
            startButton.setTitle("もう一回！", for: .normal)
            startFlag = 0
            selectStrategy = 0
        }
    }
    
    @IBAction func selectChokiButton(_ sender: Any) {
        if startFlag == 1 {
            chokiButton.backgroundColor = UIColor.brown
            selectStrategy = 1
            answerLabel.text = shuffleAction(strategy: selectStrategy!)
            startButton.setTitle("もう一回！", for: .normal)
            startFlag = 0
            selectStrategy = 0
        }
    }
    
    @IBAction func selectPaButton(_ sender: Any) {
        if startFlag == 1 {
            paButton.backgroundColor = UIColor.brown
            selectStrategy = 2
            answerLabel.text = shuffleAction(strategy: selectStrategy!)
            startButton.setTitle("もう一回！", for: .normal)
            startFlag = 0
            selectStrategy = 0
        }
    }
    
    func shuffleAction(strategy: Int) -> String {
        // 0, 1, 2の数値をランダムに算出
        answerNumber = Int(arc4random_uniform(3))
        
        if answerNumber == 0{
            answerImageView.image = UIImage(named: "gu_kai")
            answerLabel.text = "ぐー！"
            switch(strategy){
            case 0:
                return "あいこ"
            case 1:
                return "あなたの負け😭"
            default:
                return "あなたの勝ち！"
            }
        } else if answerNumber == 1 {
            answerImageView.image = UIImage(named: "choki_kai")
            answerLabel.text = "ちょき！"
            switch(strategy){
            case 0:
                return "あなたの勝ち！"
            case 1:
                return "あいこ"
            default:
                return "あなたの負け😭"
            }
        } else {
            answerImageView.image = UIImage(named: "pa_kai")
            answerLabel.text = "ぱー"
            switch(strategy){
            case 0:
                return "あなたの負け😭"
            case 1:
                return "あなたの勝ち！"
            default:
                return "あいこ"
            }
        }
    }
}

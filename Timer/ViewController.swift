//
//  ViewController.swift
//  Timer
//
//  Created by hiroki kashima on 2020/06/23.
//  Copyright © 2020 hiroki kashima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //タイマーの変数を作成
    var timer : Timer?
    //カウント（経過時間）の変数を作成
    var count = 0
    //設定値を扱うキーを設定
    let settingKey = "timer_value"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //UserDefaultのインスタンスを作成
        let settings = UserDefaults.standard
        //UserDefaultに初期値を入力
        settings.register(defaults: [settingKey:10])
        
    }
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBAction func Setting(_ sender: Any) {
    }
    
    @IBAction func Start(_ sender: Any) {
    }
    
    @IBAction func Stop(_ sender: Any) {
    }
    
    @IBAction func Reset(_ sender: Any) {
    }
    
    //画面の更新(戻り値→remainCount→残り時間)
    func displayUpdate() -> Int {
        //UserDefaultのインスタンスを作成
        let settings = UserDefaults.standard
        //取得した秒数をTimerValueに渡す
        let timerValue = settings.integer(forKey: settingKey)
        //残り時間(remainCount)を作成
        let remainCount = timerValue - count
        //ラベルに表示
        TimeLabel.text = "残り\(remainCount)秒"
        //残り時間を戻り値に設定
        return remainCount
    }
    
    //経過時間の処理
    @objc func timerInterrupt(_ timer:Timer) {
        //countに＋1していく
        count += 1
        //remainCountが0以下の時タイマーを止める
        if displayUpdate() <= 0 {
            //countを初期化
            count = 0
            //タイマーを停止
            timer.invalidate()
        }
    }
    
}


//
//  BaseViewController.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/06/18.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // UIButtonのインスタンスを作成する
        let button = UIButton(type: UIButtonType.system)
        let button2 = UIButton(type: UIButtonType.system)
        let button3 = UIButton(type: UIButtonType.system)
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        button.frame.origin = CGPoint(x: screenWidth * 0.1, y: screenHeight * 0.5)
        button2.frame.origin = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.5)
        button3.frame.origin = CGPoint(x: screenWidth * 0.7, y: screenHeight * 0.5)
        // ボタンを押した時に実行するメソッドを指定
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControlEvents.touchUpInside)
        button2.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControlEvents.touchUpInside)
        button3.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControlEvents.touchUpInside)
        // ラベルを設定する
        button.setTitle("カレンダー", for: UIControlState.normal)
        button2.setTitle("一覧", for: UIControlState.normal)
        button3.setTitle("設定", for: UIControlState.normal)
        // サイズを決める(自動調整)
        button.sizeToFit()
        button2.sizeToFit()
        button3.sizeToFit()
        // viewに追加する
        self.view.addSubview(button)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
    }
    
    // ボタンが押された時に呼ばれるメソッド
    @objc func buttonEvent(_ sender: UIButton) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "second")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

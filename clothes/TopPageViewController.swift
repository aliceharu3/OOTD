//
//  TopPageViewController.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/01/29.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import UIKit

class TopPageViewController: UIViewController {
    
    static var flag:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calender() {
        TopPageViewController.flag = true
        performSegue(withIdentifier: "calender", sender: nil)
        
    }
    
    @IBAction func clothes() {
        TopPageViewController.flag = false
        performSegue(withIdentifier: "clothes", sender: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

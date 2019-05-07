//
//  SelectedDayViewController.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/01/15.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import UIKit

class SelectedDayViewController: UIViewController {
    
    static var image :UIImage = UIImage()
    
    @IBOutlet var selectedImage :UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedImage.image = SelectedDayViewController.image
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choose() {
    
    performSegue(withIdentifier: "selectCloth", sender: nil)
    
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

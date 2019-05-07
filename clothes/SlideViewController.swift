//
//  SlideViewController.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/01/22.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import UIKit
import RealmSwift

class SlideViewController: UIViewController {
    
  var carouselView:CarouselView!
    let realm = try! Realm()
    static var realmArray:Results<RealmModel>!
    static var dateData:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        
        carouselView = CarouselView(frame: CGRect(x:-50, y:-150, width:width, height:height*0.7))
        carouselView.center = CGPoint(x:width / 2,y: height / 2.15)
        self.view.addSubview(carouselView)
        SlideViewController.realmArray = realm.objects(RealmModel.self).filter("date == %@", SlideViewController.dateData)
        
        carouselView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha:0)
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        carouselView.reloadData()
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

//
//  ViewController.swift
//  clothes
//
//  Created by Haru Ichiue on 2018/11/20.
//  Copyright © 2018年 Haru Ichiue. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var Tops: UIButton!
    @IBOutlet var Bottoms: UIButton!
    @IBOutlet var Others: UIButton!
    
    
    var realmModelArray:[RealmImageModel]!
    let realm = try! Realm()
    let dateManager :DateManager = DateManager()
    
    var date = SlideViewController.dateData
    var genre = "TOPS"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib:UINib = UINib(nibName: "ClothesCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //collectionView.backgroundColor = UIColor.init(red: 0.9, green: 0, blue: 0.1, alpha:0.5)
        
        Tops.backgroundColor = UIColor.white
        Bottoms.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        Others.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        
        Tops.setTitleColor(UIColor.black, for: .normal)
        Others.setTitleColor(UIColor.white, for: .normal)
        Bottoms.setTitleColor(UIColor.white, for: .normal)
        
        load(genre: genre)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getImage(_ sender: UIButton) {
        
        let pick = UIImagePickerController()
        pick.delegate = self
        pick.allowsEditing = true
        self.present(pick, animated: true, completion: nil)
    }
    
    func saveNewImage(newImage:UIImage, genre:String) {
        let imageData :NSData = UIImageJPEGRepresentation(newImage, 1) as! NSData
        
        var realmImageModel:RealmImageModel = RealmImageModel()
        realmImageModel.image = imageData
        realmImageModel.genre = genre
        
        try! realm.write{
            realm.add(realmImageModel)
        }
    }
    
    func saveNewData(imageData:NSData, genre:String, newDate:String) {
        
        var realModel:RealmModel = RealmModel()
        realModel.image = imageData
        realModel.date = newDate
        realModel.genre = genre
        
        try! realm.write{
            realm.add(realModel)
        }
    }
    
    func load(genre:String) {
        realmModelArray = Array(realm.objects(RealmImageModel.self).filter("genre == %@", genre))
        collectionView.reloadData()
    }
    
    @IBAction func tops(){
        genre = "TOPS"
        
        //collectionView.backgroundColor = UIColor.init(red: 0.9, green: 0, blue: 0.1, alpha:0.5)
        Tops.backgroundColor = UIColor.white
        Bottoms.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        Others.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        
        Tops.setTitleColor(UIColor.black, for: .normal)
        Others.setTitleColor(UIColor.white, for: .normal)
        Bottoms.setTitleColor(UIColor.white, for: .normal)
        
        load(genre: genre)
    }
    
    @IBAction func bottoms() {
        genre = "BOTOMS"
        
        //collectionView.backgroundColor = UIColor.init(red: 1, green: 0.9, blue: 0.5, alpha:0.9)
        
        Bottoms.backgroundColor = UIColor.white
        Tops.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        Others.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        
        Tops.setTitleColor(UIColor.white, for: .normal)
        Bottoms.setTitleColor(UIColor.black, for: .normal)
        Others.setTitleColor(UIColor.white, for: .normal)
        
        load(genre: genre)
    }
    
    @IBAction func others(){
        genre = "OTHERS"
        
        Others.backgroundColor = UIColor.white
        Bottoms.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        Tops.backgroundColor = UIColor.init(red: 0.2, green: 0, blue: 0.1, alpha:0.5)
        
        Others.setTitleColor(UIColor.black, for: .normal)
        Tops.setTitleColor(UIColor.white, for: .normal)
        Bottoms.setTitleColor(UIColor.white, for: .normal)
  
        
        //collectionView.backgroundColor = UIColor.init(red: 1, green: 0.7, blue: 0.2, alpha:0.85)
        
        load(genre: genre)
    }
    
}


extension ViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realmModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ClothesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath)as! ClothesCollectionViewCell
        let imageData:NSData = realmModelArray[indexPath.row].image
        let image : UIImage = UIImage(data:imageData as Data)!
        cell.showImage(image: image)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width * 0.306
    
        let height = width
        return CGSize(width: width, height: height)
    }
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print("tapped")
        if TopPageViewController.flag {
            saveNewData(imageData:realmModelArray[indexPath.row].image,genre: genre, newDate:SlideViewController.dateData)
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    
}


extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if info[UIImagePickerControllerOriginalImage] != nil{
            let image = info[UIImagePickerControllerEditedImage] as! UIImage
            saveNewImage(newImage: image, genre: genre)
            load(genre: genre)
        }
        dismiss(animated: true, completion: nil)
    }
}

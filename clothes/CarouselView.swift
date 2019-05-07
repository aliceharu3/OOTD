//
//  CarouselView.swift
//  clothes
//
//  Created by Haru Ichiue on 2019/01/22.
//  Copyright © 2019年 Haru Ichiue. All rights reserved.
//

import UIKit
import RealmSwift

class CarouselView: UICollectionView {
    
    let cellIdentifier = "carousel"
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
}
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        // Identifierを設定
        self.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    convenience init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: frame.height * 0.8)
        layout.scrollDirection = .horizontal
        
        self.init(frame: frame, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = UIColor.white
    }
    
    func transformScale(cell: UICollectionViewCell) {
       
            let cellCenter:CGPoint = self.convert(cell.center, to: nil) //セルの中心座標
            let screenCenterX:CGFloat = UIScreen.main.bounds.width / 2  //画面の中心座標x
            let cellCenterDisX:CGFloat = abs(screenCenterX - cellCenter.x)   //中心までの距離
            let reductionRatio:CGFloat = -0.001                        //縮小率
            let maxScale:CGFloat = 1                                    //最大値
            let newScale = reductionRatio * cellCenterDisX + maxScale   //新しいスケール
            cell.transform = CGAffineTransform(scaleX:newScale, y:newScale)
        
        }
    }
    



extension CarouselView: UICollectionViewDelegate {
    
}


extension CarouselView: UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SlideViewController.realmArray.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.imageView.image = UIImage(data:SlideViewController.realmArray[indexPath.row].image as Data)
        cell.genreLabel.text = SlideViewController.realmArray[indexPath.row].genre
        return cell
    }
    
 
}

extension CarouselView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let cells = self.visibleCells
        
        for cell in cells {

            transformScale(cell: cell)
            
        }
    }
    
}



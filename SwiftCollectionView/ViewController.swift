//
//  ViewController.swift
//  SwiftCollectionView
//
//  Created by Alex on 16/7/25.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadData()
    }
    
    func loadData() -> Void {
        dataArray = ["九宫格"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let idenifier = "CollectionCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(idenifier, forIndexPath: indexPath) as! MainCollectionCell
        
        if (dataArray.count > 0 && indexPath.row < dataArray.count)
        {
            cell.titleLbl.text = dataArray[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 60)
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self .performSegueWithIdentifier("JiugonggeVC", sender: nil)
        default:
            break
        }
    }


}


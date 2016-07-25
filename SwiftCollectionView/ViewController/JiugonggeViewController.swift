//
//  JiugonggeViewController.swift
//  SwiftCollectionView
//
//  Created by Alex on 16/7/25.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class JiugonggeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    //间隔
    let spacing:CGFloat = 1
    //列数
    let columnsNum = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCollectionView() -> Void {
        //整个view的宽度
        let collectionViewWidth = UIScreen.mainScreen().bounds.width
        let layout = UICollectionViewFlowLayout()
        self.collectionView.collectionViewLayout = layout
        
        //水平间隔
        layout.minimumInteritemSpacing = spacing
        //垂直行间距
        layout.minimumLineSpacing = spacing
        //计算单元格的宽度
        let itemWidth = collectionViewWidth/CGFloat(columnsNum)
        //设置单元格宽度和高度
        layout.itemSize = CGSizeMake(itemWidth, itemWidth)
        // 设置单元格EdgeInsets
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, -(CGFloat(columnsNum) - 1))
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let idenifier = "jggCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(idenifier, forIndexPath: indexPath)
    
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

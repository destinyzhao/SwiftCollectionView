//
//  HeaderAndFooterViewController.swift
//  SwiftCollectionView
//
//  Created by Alex on 16/7/26.
//  Copyright © 2016年 Alex. All rights reserved.
//

import UIKit

class HeaderAndFooterViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //间隔
    let spacing:CGFloat = 3
    //列数
    let columnsNum = 3
    
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
        let itemWidth = (collectionViewWidth - 4 * spacing)/CGFloat(columnsNum)
        //设置单元格宽度和高度
        layout.itemSize = CGSizeMake(itemWidth, itemWidth)
        // 设置单元格EdgeInsets
        layout.sectionInset = UIEdgeInsetsMake(spacing, spacing, spacing, spacing)
    }
    
    // 分区
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // row
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let idenifier = "HeaderAndFooterCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(idenifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.yellowColor()
        
        return cell
    }
    
    // Header view Size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: UIScreen.mainScreen().bounds.width, height: 50)
    }
    
    // Footer View Size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        
        return CGSize(width: UIScreen.mainScreen().bounds.width, height: 50)
    }
    
    // 设置 header View and Footer View
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader
        {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView", forIndexPath: indexPath) as! CollectionHeaderView
            headerView.backgroundColor = UIColor.blueColor();
            headerView.headerTitleLbl.text = "Header-" + "\(indexPath.section)"
            return headerView
            
        }
        else {
            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "FooterView", forIndexPath: indexPath) as! CollectionFooterView
            footerView.backgroundColor = UIColor.whiteColor()
            footerView.footerTitleLbl.text = "Footer-" + "\(indexPath.section)"
            return footerView
        }

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

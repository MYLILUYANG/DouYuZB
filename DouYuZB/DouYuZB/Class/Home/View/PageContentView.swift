//
//  PageContentView.swift
//  DouYuZB
//
//  Created by liluyang on 17/2/14.
//  Copyright © 2017年 liluyang. All rights reserved.
//

import UIKit

private let contentCellId = "cellContentId"

class PageContentView: UIView {
//定义属性
    private var childVcs :[UIViewController]
    private var parentViewController : UIViewController
    //懒加载属性
    private lazy var collectionview : UICollectionView = {
       
        //创建layoutflow
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .Horizontal
        
        let collectionview = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)

        collectionview.showsHorizontalScrollIndicator = false
        collectionview.showsVerticalScrollIndicator = false
        collectionview.bounces = false
        collectionview.pagingEnabled = true
        collectionview .registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellId)
        return collectionview
    }()
    //自定义构造函数
    init(frame: CGRect, childVcs : [UIViewController], parentViewController : UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
        //设置UI
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//设置UI界面  - MARk
extension PageContentView{
    private func setupUI(){
        //1
        for childVc in childVcs{
            parentViewController.addChildViewController(childVc)
            
        }
        //2 添加UICollectionView 用于在cell中存放控制器的cell
        addSubview(collectionview)
        collectionview.frame = self.bounds
        collectionview.backgroundColor = UIColor.yellowColor()
        collectionview.delegate = self
        collectionview.dataSource = self//在视频教学中不需要遵循协议
        
    }
}
//MARK - 遵守collectionview 协议

extension PageContentView : UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectionview.dequeueReusableCellWithReuseIdentifier(contentCellId, forIndexPath: indexPath)
        
        //给cell设置内容
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVC = childVcs[indexPath.row]
        childVC.view.frame = cell.contentView.frame
        cell.contentView.addSubview(childVC.view)

        return cell
        
    }
}

extension PageContentView : UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
}



























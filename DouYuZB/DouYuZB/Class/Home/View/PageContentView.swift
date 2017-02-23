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
    fileprivate var childVcs :[UIViewController]
    fileprivate weak var parentViewController : UIViewController?
    //懒加载属性
    fileprivate lazy var collectionview : UICollectionView = {
       
        //创建layoutflow
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionview = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        collectionview.showsHorizontalScrollIndicator = false
        collectionview.showsVerticalScrollIndicator = false
        collectionview.bounces = false
        collectionview.isPagingEnabled = true
        collectionview .register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellId)
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
    fileprivate func setupUI(){
        //1
        for childVc in childVcs{
            parentViewController?.addChildViewController(childVc)
            
        }
        //2 添加UICollectionView 用于在cell中存放控制器的cell
        addSubview(collectionview)
        collectionview.frame = self.bounds
        collectionview.delegate = self
        collectionview.dataSource = self//在视频教学中不需要遵循协议
        
    }
}
//MARK - 遵守collectionview 协议

extension PageContentView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: contentCellId, for: indexPath)
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}



























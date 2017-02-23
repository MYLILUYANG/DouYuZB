//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by liluyang on 17/2/12.
//  Copyright © 2017年 liluyang. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    //懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width:kScreenW, height: kTitleViewH)
        let titlesArray = ["推荐", "游戏", "娱乐", "去玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titlesArray)
        return titleView
    }()
    
    fileprivate lazy var pageContentView : PageContentView = {
        //确定内容的frame
        let contentH = kScreenH - kNavigationBarH - kStatusBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y:kNavigationBarH + kStatusBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        //确定所有的子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<4{
            let viewController = UIViewController()
            viewController.view.backgroundColor = UIColor(r: 20.0, g: 103.7, b: 202.9)
            childVcs.append(viewController)
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        return contentView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupUI()

    }
}
//mark- 设置UI界面
extension HomeViewController{
    fileprivate func setupUI(){
        automaticallyAdjustsScrollViewInsets = false
        //1 设置导航栏
        setupNavigationBar()
        //2  添加titleview
        view.addSubview(pageTitleView)
        //3 添加contentview
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.red
    }
    
    fileprivate func setupNavigationBar(){
        
        //添加左侧item
        let customBtn = UIButton()
        customBtn.setImage(UIImage(named: "Image_launch_logo"), for: UIControlState())
        customBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customBtn)
        //添加右侧item
        
        let searchItem = UIBarButtonItem .cretaItem(imageName: "searchBtnIcon", hightName: "searchBtnIconHL", size: CGSize(width: 35, height: 35))
        let scanItem = UIBarButtonItem .cretaItem(imageName: "scanIcon", hightName: "scanIconHL", size: CGSize(width: 35, height: 35))
        let historyItem = UIBarButtonItem .cretaItem(imageName: "viewHistoryIcon", hightName: "viewHistoryIconHL", size: CGSize(width: 35, height: 35))
        navigationItem.rightBarButtonItems = [searchItem,scanItem, historyItem];
        
    }
}

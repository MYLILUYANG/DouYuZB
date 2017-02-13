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
    private lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width:kScreenW, height: kTitleViewH)
        let titlesArray = ["推荐", "游戏", "娱乐", "去玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titlesArray)
        return titleView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.redColor()
        view.addSubview(pageTitleView)
        setupUI()
        // Do any additional setup after loading the view.
    }
}
//mark- 设置UI界面
extension HomeViewController{
    private func setupUI(){
        automaticallyAdjustsScrollViewInsets = false
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        
        navigationController?.navigationBar.backgroundColor = UIColor.redColor()
        //添加左侧item
        let customBtn = UIButton()
        customBtn.setImage(UIImage(named: "Image_launch_logo"), forState: .Normal)
        customBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customBtn)
        //添加右侧item
        
        let searchItem = UIBarButtonItem .cretaItem("searchBtnIcon", hightName: "searchBtnIconHL", size: CGSize(width: 35, height: 35))
        let scanItem = UIBarButtonItem .cretaItem("scanIcon", hightName: "scanIconHL", size: CGSize(width: 35, height: 35))
        let historyItem = UIBarButtonItem .cretaItem("viewHistoryIcon", hightName: "viewHistoryIconHL", size: CGSize(width: 35, height: 35))
        navigationItem.rightBarButtonItems = [searchItem,scanItem, historyItem];
        
    }
}

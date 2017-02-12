//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by liluyang on 17/2/12.
//  Copyright © 2017年 liluyang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.redColor()
        setupUI()
        // Do any additional setup after loading the view.
    }
}
//mark- 设置UI界面
extension HomeViewController{
    private func setupUI(){
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        
        navigationController?.navigationBar.backgroundColor = UIColor.redColor()
        
        let customBtn = UIButton()
        customBtn.setImage(UIImage(named: "Image_launch_logo"), forState: .Normal)
//        customBtn.frame = CGRectMake(0, 0, 100, 30)
        customBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customBtn)
        
        
        let searchItem = UIBarButtonItem .cretaItem("searchBtnIcon", hightName: "searchBtnIconHL", size: CGSize(width: 35, height: 35))
        let scanItem = UIBarButtonItem .cretaItem("scanIcon", hightName: "scanIconHL", size: CGSize(width: 35, height: 35))
        let historyItem = UIBarButtonItem .cretaItem("viewHistoryIcon", hightName: "viewHistoryIconHL", size: CGSize(width: 35, height: 35))
        navigationItem.rightBarButtonItems = [searchItem,scanItem, historyItem];
    
        
    }

    
}

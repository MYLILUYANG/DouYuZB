//
//  PageContentView.swift
//  DouYuZB
//
//  Created by liluyang on 17/2/14.
//  Copyright © 2017年 liluyang. All rights reserved.
//

import UIKit

class PageContentView: UIView {
//定义属性
    private var childVcs :[UIViewController]
    private var parentViewController : UIViewController
    
    //自定义构造函数
    init(frame: CGRect, childVcs : [UIViewController], parentViewController : UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

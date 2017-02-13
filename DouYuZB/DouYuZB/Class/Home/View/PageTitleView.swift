//
//  PageTitleView.swift
//  DouYuZB
//
//  Created by liluyang on 17/2/13.
//  Copyright © 2017年 liluyang. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {
    //定义属性
    private var titles : [String]
    
    //懒加载属性
    private lazy var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    
//MARK - 自定义构造函数
    init(frame: CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView
{
    private func setupUI(){
        addSubview(scrollView)
        //添加title对应的label
        scrollView.frame = bounds;
        setupTitleLabe()
    }
    
    private func setupTitleLabe(){
        let labelY : CGFloat = 0;
        let labelW : CGFloat = frame.width / CGFloat(titles.count);
        let labelH : CGFloat = frame.height - kScrollLineH;
        for(index, title) in titles.enumerate(){
         //创建label
            
            let label = UILabel()
            //设置label 
            label.text = title
            label.tag = index
            label.font = UIFont.systemFontOfSize(14.0)
            label.textColor = UIColor.darkGrayColor()
            label.textAlignment = .Center
            //设置label 的frame 

            let labelX : CGFloat = labelW * CGFloat(index);
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            scrollView.addSubview(label)
        }
        
    }
}























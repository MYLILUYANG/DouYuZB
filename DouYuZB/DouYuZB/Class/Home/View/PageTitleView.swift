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
    
    private lazy var titleLabels : [UILabel] = [UILabel]()
    
    private lazy var scrollLine : UIView = {
    
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orangeColor()
        return scrollLine
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
        setupTitleLabe()//添加titlelabel
        setupBottonLineAndScrollLine()//添加底部线条
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
            titleLabels .append(label)
        }
        
    }
    
    private func setupBottonLineAndScrollLine(){
        
        //添加底部线条
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGrayColor()
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: kScreenW, height: lineH)
        addSubview(bottomLine)
        
        //添加scrollline  获取第一个label
        scrollView.addSubview(scrollLine)
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor .orangeColor()
        scrollLine.frame = CGRect(x: 0, y: frame.height - kScrollLineH, width: firstLabel.frame.size.width, height: kScrollLineH)
    }
    
}























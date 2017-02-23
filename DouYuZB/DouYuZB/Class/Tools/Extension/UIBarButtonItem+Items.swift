//
//  UIBarButtonItem+Items.swift
//  DouYuZB
//
//  Created by liluyang on 17/2/12.
//  Copyright © 2017年 liluyang. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    class func cretaItem (imageName: String, hightName: String, size: CGSize ) ->UIBarButtonItem{
        let  item : UIButton = UIButton()
        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height);
        item.frame = frame;
        item.setImage(UIImage(named : imageName), for: .normal)
        item.setImage(UIImage(named : hightName ), for: .highlighted)

        
        let searchItem = UIBarButtonItem(customView: item)
        return  searchItem
    }
    
}

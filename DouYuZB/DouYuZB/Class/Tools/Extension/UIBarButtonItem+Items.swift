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
        let item = UIButton()
        item.setImage(UIImage(imageLiteral: imageName), forState: .Normal)
        item.setImage(UIImage(imageLiteral: hightName), forState: .Highlighted)
        item.frame = CGRect(origin: CGPointZero, size: size)
        let searchItem = UIBarButtonItem(customView: item)
        return  searchItem
    }
    
}

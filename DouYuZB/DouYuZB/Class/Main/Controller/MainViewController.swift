//
//  MainViewController.swift
//  DouYuZB
//
//  Created by liluyang on 17/2/12.
//  Copyright © 2017年 liluyang. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChilds("Home");
        addChilds("Discovery");
        addChilds("Focus");
        addChilds("Live");
        addChilds("Mine");
    }

    fileprivate func addChilds(_ storyBoardName : String){
        
        let controller = UINavigationController();
        
        
        let chiledVc = UIStoryboard(name: storyBoardName, bundle: nil).instantiateInitialViewController()!
        controller.title = storyBoardName
        controller.addChildViewController(chiledVc)
        addChildViewController(controller);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

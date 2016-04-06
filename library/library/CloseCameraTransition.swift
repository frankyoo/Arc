//
//  CloseCameraTransition.swift
//  library
//
//  Created by Marc Haumann on 4/6/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class CloseCameraTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let camViewController = fromViewController as! CameraViewController
//        let navViewController = toViewController as! UINavigationController
        let viewController = toViewController as! ProjectViewController
        //        viewController.openPanelButton.alpha = 1
        //        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            imageHolder.appendContentsOf(camViewController.photoImages)
            print(imageHolder)
            loadImageArray()
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let camViewController = fromViewController as! CameraViewController
        let navViewController = toViewController as! UINavigationController
        let viewController = navViewController.topViewController as! ProjectViewController
        //        viewController.openPanelButton.alpha = 1
        //        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            imageHolder.appendContentsOf(camViewController.photoImages)
            print(imageHolder)
            loadImageArray()
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}

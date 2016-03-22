//
//  panelViewController.swift
//  Arc Project View
//
//  Created by Frank Yoo on 3/16/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

class panelViewController: UIViewController {

    @IBOutlet weak var arcPanelImageView: UIImageView!
    @IBOutlet weak var panelOverButton: UIButton!
    @IBOutlet weak var panelUnderButton: UIButton!
    @IBOutlet weak var panelSButton: UIButton!
    @IBOutlet weak var panelCollapseButton: UIButton!
    
    var panelButtonInitialY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.panelOverButton.frame.origin.y = 467
        self.panelUnderButton.frame.origin.y = 467
        self.panelSButton.frame.origin.y = 467
        self.panelCollapseButton.frame.origin.y = 505
        
        self.panelOverButton.alpha = 0
        self.panelUnderButton.alpha = 0
        self.panelSButton.alpha = 0
        self.panelCollapseButton.alpha = 0
        
        // Set initial transform values 20% of original size
        let transformPanel = CGAffineTransformMakeScale(0.1, 0.1)
        let transformButtons = CGAffineTransformMakeScale(0.8, 0.8)
        // Apply the transform properties of the views
        arcPanelImageView.transform = transformPanel
        panelOverButton.transform = transformButtons
        panelUnderButton.transform = transformButtons
        panelSButton.transform = transformButtons
        // Set the alpha properties of the views to transparent
        arcPanelImageView.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.2) { () -> Void in
            // Return the views transform properties to their default states.
            self.arcPanelImageView.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.arcPanelImageView.alpha = 1
        }
        
//        print("alpha \(view.alpha)")
        
        let transformButtons = CGAffineTransformMakeScale(1, 1)
        
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.panelOverButton.frame.origin.y = 447
            self.panelOverButton.alpha = 1
            self.panelOverButton.transform = transformButtons
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.panelUnderButton.frame.origin.y = 447
            self.panelUnderButton.alpha = 1
            self.panelUnderButton.transform = transformButtons
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.panelSButton.frame.origin.y = 447
            self.panelSButton.alpha = 1
            self.panelSButton.transform = transformButtons
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.panelCollapseButton.frame.origin.y = 505
            self.panelCollapseButton.alpha = 1
            }, completion: nil)
        
    }

    @IBAction func didPressCollapse(sender: AnyObject) {
        
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.8, 0.8)
        let transformPanel = CGAffineTransformMakeScale(0.1, 0.1)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
        
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.panelOverButton.frame.origin.y = 457
            self.panelOverButton.alpha = 0
            self.panelOverButton.transform = transform
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.panelUnderButton.frame.origin.y = 457
            self.panelUnderButton.alpha = 0
            self.panelUnderButton.transform = transform
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.panelSButton.frame.origin.y = 457
            self.panelSButton.alpha = 0
            self.panelSButton.transform = transform
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.arcPanelImageView.frame.origin.y = 457
            self.arcPanelImageView.alpha = 0
            self.arcPanelImageView.transform = transformPanel
            }, completion: nil)
        
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

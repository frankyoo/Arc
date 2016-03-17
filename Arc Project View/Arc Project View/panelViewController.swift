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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressCollapse(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        dismissViewControllerAnimated(false, completion: nil)
//        storyboard.openPanelButton.alpha = 1
        
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

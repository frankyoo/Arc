//
//  ProjectViewController.swift
//  Arc Project View
//
//  Created by Frank Yoo on 3/14/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

var imageHolder: [UIImage] = []
var animation : CAKeyframeAnimation!
var currentIndex: Int!

func loadImageArray(controller: UIImageView) {
    animation = CAKeyframeAnimation(keyPath: "contents")
    animation.calculationMode = kCAAnimationDiscrete
    //        animation.timingFunction = kCAMediaTimingFunctionEaseInEaseOut
    animation.duration = 2.5
    animation.values = imageHolder.map {$0.CGImage as! AnyObject}
    animation.repeatCount = Float.infinity
    animation.removedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    controller.layer.addAnimation(animation, forKey: "contents")
}

class ProjectViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var projectNameField: UITextField!
    @IBOutlet weak var openPanelButton: UIButton!
    
    var fadeTransition: FadeTransition!
    
    func keyboardWillShow(notification: NSNotification!) {
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageArray(fullImageView)
        projectNameField.text = projects[currentIndex]["title"] as! String?
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        self.projectNameField.delegate = self;
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.3
    }

    @IBAction func didTapBackground(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print(textField.text)
        projects[currentIndex]["title"] = "\(textField.text!)"
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func addPhotoDidTap(sender: UIButton) {
        performSegueWithIdentifier("cameraSegue", sender: self)
    }
    @IBAction func didPressBack(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func didPressPanelOpen(sender: AnyObject) {
        
        openPanelButton.alpha = 0
        performSegueWithIdentifier("panelSegue", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


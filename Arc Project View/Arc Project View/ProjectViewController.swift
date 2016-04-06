//
//  ProjectViewController.swift
//  Arc Project View
//
//  Created by Frank Yoo on 3/14/16.
//  Copyright © 2016 Frank Yoo. All rights reserved.
//

import UIKit

var imageHolder: [UIImage] = []

class ProjectViewController: UIViewController {
//    var imageHolder: [UIImage] = []
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var projectNameField: UITextField!
    @IBOutlet weak var openPanelButton: UIButton!
    
    var fadeTransition: FadeTransition!
    
    func keyboardWillShow(notification: NSNotification!) {
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
    }
    
//    override func viewWillAppear(animated: Bool) {
//        fullImageView.animationImages = imageHolder
//        fullImageView.animationDuration = 2
//        fullImageView.startAnimating()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageArray()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
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
    
    func loadImageArray() {
        fullImageView.animationImages = imageHolder
        fullImageView.animationDuration = 2
        fullImageView.startAnimating()
    }

    @IBAction func didTapBackground(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func addPhotoDidTap(sender: UIButton) {
        performSegueWithIdentifier("cameraSegue", sender: self)
    }
    @IBAction func didPressBack(sender: AnyObject) {
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


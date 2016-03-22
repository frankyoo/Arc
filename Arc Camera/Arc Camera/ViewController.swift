//
//  ViewController.swift
//  Arc Camera
//
//  Created by Vicki Tan on 3/7/16.
//  Copyright © 2016 Vicki Tan. All rights reserved.
//

import UIKit
import PBJVision

class ViewController: UIViewController, PBJVisionDelegate {
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    
    let vision = PBJVision.sharedInstance()
    
    var photoImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        blurEffectView.frame = CGRect(x: (view.frame.width / 2 ) - 50, y: 550, width: 100, height: 100)
//        shadowView.frame = blurEffectView.frame
        blurEffectView.layer.cornerRadius = 50
        blurEffectView.clipsToBounds = true
        blurEffectView.layer.borderColor = UIColor.grayColor().CGColor
        blurEffectView.layer.borderWidth = 0.5
        
        blurEffectView.layer.shadowColor = UIColor.orangeColor().CGColor
        blurEffectView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        blurEffectView.layer.shadowOpacity = 1
        blurEffectView.layer.shadowRadius = 1
//        blurEffectView.layer.shadowPath = blurEffectView.path
//        layer.insertSublayer(blurEffectView, atIndex: 0)
        
        view.bringSubviewToFront(blurEffectView)
        
        vision.delegate = self
        vision.cameraMode = PBJCameraMode.Photo
        vision.cameraOrientation = PBJCameraOrientation.Portrait
        vision.focusMode = PBJFocusMode.ContinuousAutoFocus
        vision.outputFormat = PBJOutputFormat.Widescreen
        
        vision.startPreview()
        
        let layer = vision.previewLayer
        layer.frame = cameraView.bounds
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        cameraView.layer.addSublayer(layer)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake && photoImages.count >= 1 {
        print("started shaking")
        
        let alertController = UIAlertController(title: nil, message: "Undo last photo?", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (UIAlertAction) -> Void in
        })
        alertController.addAction(cancelAction)
        let undoAction = UIAlertAction(title: "Undo", style: .Default, handler: { (UIAlertAction) -> Void in
            if self.photoImages.count >= 2 {
                let priorPhoto = self.photoImages[self.photoImages.count - 2]
                self.thumbnailView.image = priorPhoto
                self.photoImages.removeAtIndex(self.photoImages.count - 1)
            } else {
                self.photoImages.removeAll()
                self.thumbnailView.image = nil
            }
        })
        alertController.addAction(undoAction)
        presentViewController(alertController, animated: true, completion: { () -> Void in
        })
        }
    }
    
    
    @IBAction func onCaptureButton(sender: AnyObject) {
        vision.capturePhoto()
    }
    
    func vision(vision: PBJVision, capturedPhoto photoDict: [NSObject : AnyObject]?, error: NSError?) {
        let image = photoDict![PBJVisionPhotoImageKey] as! UIImage
        
        thumbnailView.image = image
        vision.startPreview()
        photoImages.append(image)
        print(photoImages.count)
    }
    
    @IBAction func onFlipButton(sender: AnyObject) {
        if vision.cameraDevice == PBJCameraDevice.Front {
            vision.cameraDevice = PBJCameraDevice.Back
        } else {
            vision.cameraDevice = PBJCameraDevice.Front
        }
    }
    
    
}


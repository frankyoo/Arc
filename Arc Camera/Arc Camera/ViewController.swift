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
        
        
        blurEffectView.frame = CGRect(x: (view.frame.width / 2 ) - 50, y: 550, width: 100, height: 100)
        blurEffectView.layer.cornerRadius = 50
        blurEffectView.clipsToBounds = true
        blurEffectView.layer.borderColor = UIColor.grayColor().CGColor
        blurEffectView.layer.borderWidth = 0.5
        blurEffectView.layer.shadowColor = UIColor.blackColor().CGColor
        blurEffectView.layer.shadowOffset = CGSizeMake(5, 5)
        
        
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
    
    @IBAction func onUndoTap(sender: AnyObject) {
        if photoImages.count >= 2 {
            let priorPhoto = photoImages[photoImages.count - 2]
            thumbnailView.image = priorPhoto
            photoImages.removeAtIndex(photoImages.count - 1)
        } else {
            photoImages.removeAll()
            thumbnailView.image = nil
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


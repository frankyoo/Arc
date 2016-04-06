//
//  ViewController.swift
//  Arc Camera
//
//  Created by Vicki Tan on 3/7/16.
//  Copyright © 2016 Vicki Tan. All rights reserved.
//

import UIKit
import PBJVision
import Parse

class CameraViewController: UIViewController, PBJVisionDelegate {
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    
    let vision = PBJVision.sharedInstance()
    
    var photoImages: [UIImage] = []
    var arrayImage = PFObject(className:"UIImage")
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< Updated upstream:Arc Camera/Arc Camera/ViewController.swift

=======
        
        
        
//        blurEffectView.frame = CGRect(x: (view.frame.width / 2 ) - 50, y: 550, width: 100, height: 100)
//        shadowView.frame = blurEffectView.frame
>>>>>>> Stashed changes:Arc Camera/Arc Camera/CameraViewController.swift
        blurEffectView.layer.cornerRadius = 50
        blurEffectView.clipsToBounds = true

        
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
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func vision(vision: PBJVision, capturedPhoto photoDict: [NSObject : AnyObject]?, error: NSError?) {
        let image = photoDict![PBJVisionPhotoImageKey] as! UIImage
        
        thumbnailView.image = image
        vision.startPreview()
        let scaledImage = resize(image, newSize: CGSize(width: 640, height: 1136))
        let imageData = UIImageJPEGRepresentation(scaledImage, 0.7)
        photoImages.append(scaledImage)
        print(scaledImage)
        let imageFile = PFFile(name: "image.jpg", data: imageData!)
        imageFile?.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) in
            if (success) {
                let newObject = PFObject(className:"PhotoObject")
                newObject.setObject(imageFile!, forKey: "image")
                newObject.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    if (success) {
                        print("The object has been saved")
                    } else {
                        print("There was a problem, check error.description")
                    }
                }
                print("The object has been saved")
            } else {
                print("There was a problem, check error.description")
            }
        })
//        arrayImage.setObject(imageFile!, forKey: "image")
//        arrayImage["image"] = imageFile
//        arrayImage.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            if (success) {
//                print("The object has been saved")
//            } else {
//                print("There was a problem, check error.description")
//            }
//        }
    }
    
    @IBAction func onFlipButton(sender: AnyObject) {
        if vision.cameraDevice == PBJCameraDevice.Front {
            vision.cameraDevice = PBJCameraDevice.Back
        } else {
            vision.cameraDevice = PBJCameraDevice.Front
        }
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}


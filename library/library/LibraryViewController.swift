//
//  LibraryViewController.swift
//  library
//
//  Created by Marc Haumann on 3/7/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit
import Parse
var projects = [
    [
        "title" : "row 1",
        "background" : [
            UIImage(named: "IMG_0109.jpg")!,
            UIImage(named: "IMG_0110.jpg")!,
            UIImage(named: "IMG_0111.jpg")!,
            UIImage(named: "IMG_0112.jpg")!,
            UIImage(named: "IMG_0113.jpg")!,
            UIImage(named: "IMG_0114.jpg")!,
            UIImage(named: "IMG_0115.jpg")!,
            UIImage(named: "IMG_0116.jpg")!,
            UIImage(named: "IMG_0117.jpg")!,
            UIImage(named: "IMG_0118.jpg")!
        ]
        
    ],[
        "title" : "row 2",
        "background" : [
            UIImage(named: "IMG_0109.jpg")!,
            UIImage(named: "IMG_0110.jpg")!,
            UIImage(named: "IMG_0111.jpg")!,
            UIImage(named: "IMG_0112.jpg")!,
            UIImage(named: "IMG_0113.jpg")!,
            UIImage(named: "IMG_0114.jpg")!,
            UIImage(named: "IMG_0115.jpg")!
        ]
    ]
]

class LibraryViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = 200
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell") as! ProjectTableViewCell
        cell.projectTitle.text = "Arc \(indexPath.row+1)"
        var test = projects[indexPath.row]["background"] as! NSArray?
        print(test!)
        if test != nil {
           cell.projectImageView.animationImages = test! as! [UIImage]
            cell.projectImageView.animationDuration = 2
            cell.projectImageView.startAnimating()
        }
//        cell.backgroundColor = UIColor(red: 230/255, green: 240/255, blue: 255/255, alpha: 1)
        
        // Configure YourCustomCell using the outlets that you've defined.
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        let index = indexPath?.row
        // Get in touch with the DetailViewController
        let detailViewController = segue.destinationViewController as! ProjectViewController
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        let newImage = projects[index!]["background"] as! NSArray?
        if newImage != nil {
            detailViewController.imageHolder = newImage! as! [UIImage]
        }
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

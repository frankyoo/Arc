//
//  LibraryViewController.swift
//  library
//
//  Created by Marc Haumann on 3/7/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit
import Parse
var projects: [NSMutableDictionary] = [
    [
        "title" : "Team Arc",
        "background" : [
            UIImage(named: "teamarc1.jpg")!,
            UIImage(named: "teamarc2.jpg")!,
            UIImage(named: "teamarc3.jpg")!,
            UIImage(named: "teamarc4.jpg")!,
            UIImage(named: "teamarc5.jpg")!,
            UIImage(named: "teamarc6.jpg")!
        ]
        
    ],[
        "title" : "Food Coma",
        "background" : [
            UIImage(named: "food1.jpg")!,
            UIImage(named: "food2.jpg")!,
            UIImage(named: "food3.jpg")!,
            UIImage(named: "food4.jpg")!,
            UIImage(named: "food5.jpg")!,
            UIImage(named: "food6.jpg")!,
            UIImage(named: "food7.jpg")!
        ]
    ],[
        "title" : "Hovering Feet",
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
        cell.projectTitle.text = projects[indexPath.row]["title"] as! String?
//        cell.backgroundColor = UIColor(red: 230/255, green: 240/255, blue: 255/255, alpha: 1)
        imageHolder = projects[indexPath.row]["background"] as! [UIImage]
        loadImageArray(cell.projectImageView)
//        var test = projects[indexPath.row]["background"] as! NSArray?
//        print(test!)
//        if test != nil {
//           cell.projectImageView.animationImages = test! as! [UIImage]
//            cell.projectImageView.animationDuration = 2
//            cell.projectImageView.startAnimating()
//        }
        
        
        // Configure YourCustomCell using the outlets that you've defined.
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        currentIndex = indexPath?.row
        // Get in touch with the DetailViewController
        let detailViewController = segue.destinationViewController as! ProjectViewController
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        let newImage = projects[currentIndex!]["background"] as! NSArray?
        if newImage != nil {
            imageHolder = newImage! as! [UIImage]
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

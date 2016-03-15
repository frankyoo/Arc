//
//  LibraryViewController.swift
//  library
//
//  Created by Marc Haumann on 3/7/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var projects: NSArray! = [
        [
            "title" : "row 1",
            "background" : "test_image.png"
        
        ],[
            "title" : "row 2",
            "background" : "test_image.png"
        ]
    ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 320
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell") as! ProjectTableViewCell
//        cell.textLabel!.text = "This is \(indexPath.row)"
        var test = projects[indexPath.row]["background"]
        print(test)
        cell.imageView!.image = UIImage(named: "\(projects[indexPath.row]["background"])")
//        cell.backgroundColor = UIColor(red: 230/255, green: 240/255, blue: 255/255, alpha: 1)
        
        // Configure YourCustomCell using the outlets that you've defined.
        
        return cell
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

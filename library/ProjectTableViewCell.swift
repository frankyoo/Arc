//
//  ProjectTableViewCell.swift
//  library
//
//  Created by Marc Haumann on 3/7/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var projectImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

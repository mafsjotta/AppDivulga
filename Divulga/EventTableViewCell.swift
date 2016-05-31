//
//  EventTableViewCell.swift
//  Divulga
//
//  Created by Mafalda Garcia on 21/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit


class EventTableViewCell: UITableViewCell {
    
    
    // MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var orgLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

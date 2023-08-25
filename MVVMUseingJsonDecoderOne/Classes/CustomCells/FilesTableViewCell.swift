//
//  FilesTableViewCell.swift
//  APICALLING3
//
//  Created by RW on 07/02/22.
//

import UIKit

class FilesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var fileOneOutlet: UILabel!
    @IBOutlet weak var fileTwoOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var sourceoutlet: UILabel!
    @IBOutlet weak var orignalOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  DataSeriesTableViewCell.swift
//  APICALLING3
//
//  Created by DISHA on 25/02/22.
//

import UIKit

class DataSeriesTableViewCell: UITableViewCell {

    //MARK: -Outlets of cell's Label
    @IBOutlet weak var timePointLable: UILabel!
    @IBOutlet weak var transparancyLable: UILabel!
    @IBOutlet weak var rythemLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  DemoTableViewCell2.swift
//  tables
//
//  Created by Mphrx. on 19/10/21.
//

import UIKit

class DemoTableViewCell2: UITableViewCell {
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

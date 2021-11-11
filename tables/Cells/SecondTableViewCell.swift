//
//  SecondTableViewCell.swift
//  tables
//
//  Created by Mphrx. on 27/10/21.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

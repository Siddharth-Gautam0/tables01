//
//  DemoWebViewCell.swift
//  tables
//
//  Created by Mphrx. on 20/10/21.
//

import UIKit
import WebKit

class DemoWebViewCell: UITableViewCell, WKUIDelegate, WKNavigationDelegate{
    @IBOutlet var webView: WKWebView!
    @IBOutlet var tableView: UITableView!
    var contentHeight: CGFloat = 0
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

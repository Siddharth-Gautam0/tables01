////
////  ViewControllerExtension.swift
////  tables
////
////  Created by Mphrx. on 08/11/21.
////
//
import UIKit
import WebKit
//import Darwin
import Foundation

extension ViewController : UITableViewDelegate, UITableViewDataSource, WKNavigationDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func webView(_webView: WKWebView, didFinish navigation: WKNavigation!){
        if contentHeight != 0{
            return
        }
        contentHeight = webView.scrollView.contentSize.height
        print(contentHeight, "Content height")
        tableView.reloadRows(at:[IndexPath(row:2, section:0)], with:.automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data[indexPath.row].type == "Text"{
            return 200
        }
        else if data[indexPath.row].type == "WebView" {
                if contentHeight != 0{
                    return contentHeight
                }
            else{
                return 250
            }
            
        }
        else{
            return UITableView.automaticDimension
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print(myData)
        //print(RES)

        if data[indexPath.row].type == "Text"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell",
                for: indexPath) as! DemoTableViewCell
            cell.myLabel.text = data[indexPath.row].text
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            return cell
        }
        
        if data[indexPath.row].type == "ResizableCard"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell2",
                for: indexPath) as! DemoTableViewCell2
            cell.myLabel.text = data[indexPath.row].text
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DemoWebViewCell",
                for: indexPath) as! DemoWebViewCell
            cell.webView.navigationDelegate = self
            cell.webView.load(URLRequest(url: URL(string: data[indexPath.row].url!)!))
            cell.webView.scrollView.isScrollEnabled = false
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.page2 = data[indexPath.row].baseURL!
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }

}

//
//  DetailViewController.swift
//  tables
//
//  Created by Mphrx. on 27/10/21.
//

import UIKit
import WebKit
import Darwin
import Foundation

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WKUIDelegate{
    //@IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    var page2 = ""
    var cell2Data: [String] = []
    var RESS: [Result] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RESS.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140//UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell",
            for: indexPath) as! SecondTableViewCell
        cell.desc.text = RESS[indexPath.row].text
        cell.name.text = RESS[indexPath.row].name
        let urls = loadImage(from: RESS[indexPath.row].imageURL!)
        cell.img.image = UIImage(data: urls)
        //cell.textLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    struct Response: Codable
    {
        let results: [Result]
    }

    struct Result: Codable
    {
        
        let _id: String
        let name: String?
        let text: String?
        let imageURL: String?
        
    }
    
    func loadImage(from paths: String) -> Data
    {
        let url = URL(string: paths)!
    
        let data = (try? Data(contentsOf: url))!
    
        return data
    }
    
    func getData(from page: String){
        //var cellTypes: [String] = []
        cell2Data.removeAll()
        let task = URLSession.shared.dataTask(with: URL(string: page)!, completionHandler:  { data, response, error in
            
            guard let data = data, error==nil else{
                print("Something went wrong")
                return
            }

            
            var result: [Result]?
            do{
            result = try JSONDecoder().decode([Result].self, from: data)
            }
            catch{
                
                print("Couldn't parse. \(error)")
            }
            
            let xyz = result?.count
            for i in 0...xyz!-1{
                self.cell2Data.append(result![i].text!)
            }
            self.RESS = result!
            print(type(of: result))
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
            
        })
        task.resume()
        
    }
    
    override func viewDidLoad() {
        let Nib = UINib(nibName: "SecondTableViewCell", bundle: nil)
        tableView.register(Nib, forCellReuseIdentifier: "SecondTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        page2 = page2 + "?access_token=hapmwass5t9uis8jenssbqz8ee03vy5zc88hj5iw"
        getData(from: page2)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

//
//  ViewController.swift
//  tables
//
//  Created by Mphrx. on 19/10/21.
//

import UIKit
import WebKit
//import Darwin
import Foundation

class ViewController: UIViewController, WKUIDelegate {
    
    private let apiCaller = APICaller()
    private let decider = Decider()
    
    @IBOutlet var tableView: UITableView!
    var webView: WKWebView!
    var contentHeight: CGFloat = 0
    
    let page1 = "https://api.json-generator.com/templates/AqlGwnzXxIHt/data?access_token=hapmwass5t9uis8jenssbqz8ee03vy5zc88hj5iw"

//
    struct Model: Identifiable
    {
        var id = UUID()
        var title: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        let DynamicNib = UINib(nibName: "DemoTableViewCell2", bundle: nil)
        let WebViewNib = UINib(nibName: "DemoWebViewCell", bundle: nil)
        
        //Registering Cell 1
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        //Registering Cell 2
        tableView.register(DynamicNib, forCellReuseIdentifier: "DemoTableViewCell2")
        //Registering Cell 3
        tableView.register(WebViewNib, forCellReuseIdentifier: "DemoWebViewCell")

        tableView.delegate = self
        tableView.dataSource = self
        
        //getData(from: page)
//        apiCaller.fetchData(completion: {[weak self] result in
//            switch result{
//            case .success(let tempData):
//                self!.data.append(contentsOf: tempData)
//                //print(self?.data)
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            case .failure(_):
//                break
//            }
//        })
        
        tableView.refreshControl = UIRefreshControl()
//        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    var data2: [APICaller.Response2] = []
    var data: [List] = []
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//        apiCaller.fetchData(completion: {[weak self] result in
//            switch result{
//            case .success(let tempData):
//                self!.data.append(contentsOf: tempData)
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            case .failure(_):
//                break
//            }
//        })
//    }
    
//    @objc private func didPullToRefresh()
//    {
//        apiCaller.fetchData(completion: {[weak self] result in
//            switch result{
//            case .success(let tempData):
//                self!.data.append(contentsOf: tempData)
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            case .failure(_):
//                break
//            }
//        })
//    }
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if apiCaller.isPaginating {
            return
        }
        let position = scrollView.contentOffset.y
        if position == 0 {
            return
        }
//        let percent = ((tableView.contentOffset.y+scrollView.frame.size.height)/tableView.contentSize.height)
        
        let buffer =
        tableView.contentSize.height - (tableView.contentOffset.y + scrollView.frame.size.height)
        
        if buffer < 400{ //percent > 0.8{
//            let app: [List] = []
//            let app: [List] = decider.coreOrApi(len: data.count)
            
            decider.coreOrApi(len: data.count) { [self] info in
                self.data.append(contentsOf: info[data.count...data.count+11])
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
//                do{
//
//                    guard let result =  try PersistentStorage.shared.context.fetch(List.fetchRequest()) as? [List] else{return}
////                    print(result)
//                    self.data.append(contentsOf: result[data.count...data.count+11])
//                    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//                    print(path[0])
//
//                }
//                catch let error
//                {
//                    debugPrint(error)
//                }
                
//            else{
//            print("Reached the end")
//            apiCaller.isPaginating = true
//
//            print(data.count)
//            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            debugPrint(path[0])
//
//            apiCaller.fetchData(completion: {[weak self] result in
//                switch result{
//                case .success(let tempData):
//                    self!.data2.append(contentsOf: tempData)
//
//                    for i in 0...11
//                    {
//                        let list = List(context: PersistentStorage.shared.context)
//                        list.id = self!.data2[i]._id
//                        print(self!.data2[i]._id!)
//                        list.type = self!.data2[i].type
//                        list.text = self!.data2[i].text
//                        list.url = self!.data2[i].url
//                        list.baseURL = self!.data2[i].baseURL
//                        print("Data added")
//
//                    }
//
//                    PersistentStorage.shared.saveContext()
//
//                    DispatchQueue.main.async {
//                        self?.tableView.reloadData()
//                    }
//                case .failure(_):
//                    break
//                }
////                print(self!.data)
////                let list = List(context: PersistentStorage.shared.context)
////                list.url = self!.data[0].url!
//                //PersistentStorage.shared.saveContext()
//                debugPrint(path[0])
//                self!.apiCaller.isPaginating = false
//            })
//            print(data.count)
//        }
        }
            
    }
    
    
    
}


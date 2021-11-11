//
//  NetworkManager.swift
//  tables
//
//  Created by Mphrx. on 08/11/21.
//

import Foundation

private let coreDataCaller = CoreDataCaller()
private let apiCaller = APICaller()

class Decider{
    
    var data3: [List] = []
    var data2: [APICaller.Response2] = []
    
    func coreOrApi(len: Int, completion: @escaping([List]) -> Void){
        if ifDataExists(num: len){
            let info = coreDataCaller.fetchCore()
//            return info
            completion(info)
        }
    //return da
        else {
            print("Something")
            apiCaller.isPaginating = true
            apiCaller.fetchData(completion: {[weak self] result in
                switch result{
                case .success(let tempData):
                    self!.data2.append(contentsOf: tempData)
                    print(self!.data2.count)
                    
                    coreDataCaller.addToCore(data2: self!.data2)
                    PersistentStorage.shared.saveContext()
                    let info = coreDataCaller.fetchCore()
        //            return info
                    completion(info)
                    
                case .failure(_):
                    break
                }
                apiCaller.isPaginating = false
        })
            
        }
    }
    
    func ifDataExists(num: Int) -> Bool
    {
        do{
            guard let result =  try PersistentStorage.shared.context.fetch(List.fetchRequest()) as? [List] else{return false}
            
            print(result.count, "entries from database")
            print(num, "current rows to be compared")
            if result.count > num{
                return true
            }else{return false}
            
        } catch let error
        {
            debugPrint(error)
        }
        
        return false
    }
    
}

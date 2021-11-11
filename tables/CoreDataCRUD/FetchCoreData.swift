//
//  FetchCoreData.swift
//  tables
//
//  Created by Mphrx. on 08/11/21.
//

import Foundation

class CoreDataCaller {
    var da: [List] = []
    func fetchCore() -> [List]{
        do{
            
            guard let result =  try PersistentStorage.shared.context.fetch(List.fetchRequest()) as? [List] else{return da}
//                    print(result)
            //self.data.append(contentsOf: result[data.count...data.count+9])
            return result
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            print(path[0])
            
        }
        catch let error
        {
            debugPrint(error)
        }
        return da
    }
    
    func addToCore(data2: [APICaller.Response2]){
        
        
        for i in 0...11
        {
            let list = List(context: PersistentStorage.shared.context)
            list.id = data2[i]._id
            list.type = data2[i].type
            list.text = data2[i].text
            list.url = data2[i].url
            list.baseURL = data2[i].baseURL
        }
        
        PersistentStorage.shared.saveContext()
    }
}

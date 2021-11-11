//
//  APICaller.swift
//  tables
//
//  Created by Mphrx. on 03/11/21.
//

import Foundation

class APICaller
{
    var RES: [Response2] = []
    var RES2: [Response2] = []
    var RES3: [Response2] = []
    
    var isPaginating = false
    
    
    func fetchData(pagination: Bool = false, completion: @escaping (Swift.Result<[Response2], Error>)->Void)
    {
        
            URLSession.shared.dataTask(with: URL(string: "https://api.json-generator.com/templates/AqlGwnzXxIHt/data?access_token=hapmwass5t9uis8jenssbqz8ee03vy5zc88hj5iw")!) { [self] respData, response, error in
                
                guard let data = respData, error==nil else{
                    print("Something went wrong")
                    return
                }

                var result: Response?
                do{
                result = try JSONDecoder().decode(Response.self, from: data)
                self.RES = result!.list
                completion(.success(self.RES))
                //print(type(of: result))
                }
                catch{
                    
                    print("Couldn't parse. \(error)")
                }
                
            
            }.resume()
            
            
            
        
        
    }
    
    struct Response: Codable
    {
        
        let list: [Response2]
        let totalCount: Int?
    }

    struct Response2: Codable
    {

        let _id: String?
        let url: String?
        let text: String?
        let type: String?
        let baseURL: String?

    }
    
    
}

//
//  ApiServices.swift
//  FoodOrderingApp
//
//  Created by mac on 31/08/2022.
//

import Foundation
import Alamofire
import Accelerate

class ApiServices{
    static let shared = ApiServices()
    private init(){}
    
    
    func createRequest<T:Codable>(url : String , method : HTTPMethod ,completion : @escaping(T?, Error?)->Void  , parameters : Parameters? = nil){
        print("url is ",url)
        AF.request(url , method : method , parameters: parameters , encoding : JSONEncoding.default).responseString { response in
            guard let data = response.data else{return}
            switch response.result{
            case .success:
                do{
                    let orders = try JSONDecoder().decode(T.self, from: data)
                    print("orders is \(orders)")
                    completion(orders,nil)
                }catch let error{
                    print(error)
                    completion(nil,error)
                }
            case .failure(let error):
                print(error)
                completion(nil,error)
            }
        }
        
        
    }
    
}


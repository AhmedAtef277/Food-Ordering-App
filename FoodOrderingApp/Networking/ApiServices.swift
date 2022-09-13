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
    
    func getAllDishes(url : String , completion :  @escaping ((AllDishes? , Error?) ->Void)) -> Void{
//        AF.request(url , method: .get).responseString { response in
//            guard let data = response.data else {return}
//
//            switch response.result{
//            case .success:
//
//                do{
//                    let myData = try JSONDecoder().decode(AllDishes.self, from: data)
//                    print("my data is \(myData)")
//                    completion(myData , nil)
//                }catch let error{
//                    completion(nil,error)
//                }
//            case .failure(let error):
//                completion(nil,error)
//            }
//        }
        createRequest(url: url, method: .get, completion: completion)

        
    }
    
    func palceOrder(url : String , name : String , completion : @escaping ((PlaceOrderResponse? , Error?)->Void)){
        let parameters = ["name" : name]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
            switch response.result{
            case .success(let value):
                guard let data = response.data else{return}
                do{
                    let placeOrderResponse = try JSONDecoder().decode(PlaceOrderResponse.self, from: data)
                    print(placeOrderResponse)
                    completion(placeOrderResponse, nil)
                }catch let error{
                    print("error is \(error)")
                    completion(nil,error)
                }
                print("value is \(value)")
            case.failure(let error):
                print("error is \(error)")
                completion(nil,error)
            }
        }
        

        
    }
    func fetchCategoriesDishes(url : String , completion : @escaping ((CategoriesDishes? , Error?)->Void)){
        //print("url is ",url)
        
//        AF.request(url , method: .get).responseString { response in
//            guard let data = response.data else{return}
//            switch response.result{
//            case .success:
//                do{
//                    let categriesDishes = try JSONDecoder().decode(CategoriesDishes.self, from: data)
//                   // print("categriesDishes is \(categriesDishes)")
//                    completion(categriesDishes,nil)
//                }catch let error{
//                    print(error)
//                    completion(nil,error)
//                }
//            case .failure(let error):
//                print(error)
//                completion(nil,error)
//            }
//        }
        createRequest(url: url, method: .get, completion: completion)

        
        
    }
    
    func fetchOrders(url : String ,  completion : @escaping(PlacedOrders?, Error?)->Void){
//        print("url is ",url)
//        AF.request(url , method: .get).responseString { response in
//            guard let data = response.data else{return}
//            switch response.result{
//            case .success:
//                do{
//                    let orders = try JSONDecoder().decode(PlacedOrders.self, from: data)
//                    print("orders is \(orders)")
//                    completion(orders,nil)
//                }catch let error{
//                    print(error)
//                    completion(nil,error)
//                }
//            case .failure(let error):
//                print(error)
//                completion(nil,error)
//            }
//        }
        createRequest(url: url, method: .get, completion: completion)
    }
    
    
    private func createRequest<T:Codable>(url : String , method : HTTPMethod ,completion : @escaping(T?, Error?)->Void  , parameters : Parameters? = nil){
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


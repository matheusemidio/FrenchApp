//
//  VerbAPI.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-19.
//


import Foundation
import UIKit

class VerbAPI: Decodable {

    static func getRandomVerb(randomMode : Bool,
                             successHandler: @escaping (_ httpStatusCode : Int, _ response : [String]) -> Void,
                             failHandler : @escaping (_ httpStatusCode : Int, _ errorMessage: String) -> Void)
    {


//        //Second API attempt
//        let baseURL = "http://localhost:8080/"
//        let endPoint = "words?quantity=\(amountOfWords)"
//
//        let method = "GET"
//
//
//        let payload : [String:String] = [:]
//
//        API.call(baseURL: baseURL, endPoint: endPoint, method: method, payload: payload, successHandler: successHandler, failHandler: failHandler)
    }

}


struct RandomVerb : Codable {
    
    var first_group : [String]
    var second_group : [String]
    var third_group : [String]
    
    
    static func decode( json : [String : Any] ) -> RandomVerb? {
        
        let decoder = JSONDecoder()
        do{
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let object = try decoder.decode(RandomVerb.self, from: data)
            return object
        }catch{
            
        }
        return nil
    }
    
    
}


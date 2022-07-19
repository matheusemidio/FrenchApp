


import Foundation
import UIKit

class VerbAPI: Decodable {

    static func getVerbConjugation(verb : String,
                             successHandler: @escaping (_ httpStatusCode : Int, _ response : [String: Any]) -> Void,
                             failHandler : @escaping (_ httpStatusCode : Int, _ errorMessage: String) -> Void)
    {


        //Second API attempt
    

        let baseURL = "https://french-conjugaison.p.rapidapi.com/conjugate/"
        let endPoint = "\(verb)"

        let method = "GET"
        
        
     
//
//        let header = ["" : "",
//                      "" : ""]
        
        let payload : [String:String] = [:]

        API.call(baseURL: baseURL, endPoint: endPoint, method: method, header: header, payload: payload, successHandler: successHandler, failHandler: failHandler)
//        API.call(baseURL: baseURL, endPoint: endPoint, method: method, payload: payload, successHandler: successHandler, failHandler: failHandler)
    }

}

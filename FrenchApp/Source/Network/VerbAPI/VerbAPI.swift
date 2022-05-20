//
//  VerbAPI.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-19.
//


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
        
        
  

        let header = ["" : "",
                      "" : ""]
        
        let payload : [String:String] = [:]

        API.call(baseURL: baseURL, endPoint: endPoint, method: method, header: header, payload: payload, successHandler: successHandler, failHandler: failHandler)
//        API.call(baseURL: baseURL, endPoint: endPoint, method: method, payload: payload, successHandler: successHandler, failHandler: failHandler)
    }

}


//struct VerbAPIConjugation : Codable {
//
//    var indicatif : String
//
//    static func decode( json : [String : Any] ) -> VerbAPIConjugation? {
//
//        let decoder = JSONDecoder()
//        do{
//            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
//            let object = try decoder.decode(VerbAPIConjugation.self, from: data)
//            return object
//        }catch{
//
//        }
//        return nil
//    }
//}

// MARK: - VerbConjugation
struct VerbAPIConjugation: Codable {
    let data : DataClass
    
    static func decode( json : [String : Any] ) -> String? {
        
        let decoder = JSONDecoder()
        do{
            let dataInfo = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            
            let jsonString = String(data: dataInfo, encoding: .utf8)!

            
//            let object = try decoder.decode(VerbAPIConjugation.self, from: dataInfo)
            

            return jsonString
        }catch{
            
        }
        return nil
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let indicatif: Indicatif
}

// MARK: - Indicatif
struct Indicatif: Codable {
    let present: Present
    let passeSimple: PasseSimple
    let imparfait: Imparfait
    let passeCompose: PasseCompose
    let futurSimple: FuturSimple
    let passeAnterieur: PasseAnterieur
    let plusQueParfait: PlusQueParfait
    let futurAnterieur: FuturAnterieur
}

// MARK: - FuturAnterieur
struct FuturAnterieur: Codable {
    let indicatifFuturAnterieurI, indicatifFuturAnterieurYou, indicatifFuturAnterieurHeSheIt, indicatifFuturAnterieurWe: String
    let indicatifFuturAnterieurYouAll, indicatifFuturAnterieurThey: String
}

// MARK: - FuturSimple
struct FuturSimple: Codable {
    let indicatifFuturSimpleI, indicatifFuturSimpleYou, indicatifFuturSimpleHeSheIt, indicatifFuturSimpleWe: String
    let indicatifFuturSimpleYouAll, indicatifFuturSimpleThey: String
}

// MARK: - Imparfait
struct Imparfait: Codable {
    let indicatifImparfaitI, indicatifImparfaitYou, indicatifImparfaitHeSheIt, indicatifImparfaitWe: String
    let indicatifImparfaitYouAll, indicatifImparfaitThey: String
}

// MARK: - PasseAnterieur
struct PasseAnterieur: Codable {
    let indicatifPasseAnterieurI, indicatifPasseAnterieurYou, indicatifPasseAnterieurHeSheIt, indicatifPasseAnterieurWe: String
    let indicatifPasseAnterieurYouAll, indicatifPasseAnterieurThey: String
}

// MARK: - PasseCompose
struct PasseCompose: Codable {
    let indicatifPasseComposeI, indicatifPasseComposeYou, indicatifPasseComposeHeSheIt, indicatifPasseComposeWe: String
    let indicatifPasseComposeYouAll, indicatifPasseComposeThey: String
}

// MARK: - PasseSimple
struct PasseSimple: Codable {
    let indicatifPasseSimpleI, indicatifPasseSimpleYou, indicatifPasseSimpleHeSheIt, indicatifPasseSimpleWe: String
    let indicatifPasseSimpleYouAll, indicatifPasseSimpleThey: String
}

// MARK: - PlusQueParfait
struct PlusQueParfait: Codable {
    let indicatifPlusQueParfaitI, indicatifPlusQueParfaitYou, indicatifPlusQueParfaitHeSheIt, indicatifPlusQueParfaitWe: String
    let indicatifPlusQueParfaitYouAll, indicatifPlusQueParfaitThey: String
}

// MARK: - Present
struct Present: Codable {
    let indicatifPresentI, indicatifPresentYou, indicatifPresentHeSheIt, indicatifPresentWe: String
    let indicatifPresentYouAll, indicatifPresentThey: String
}



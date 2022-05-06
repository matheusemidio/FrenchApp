//
//  Authentication.swift
//  FirebaseChat_1931358
//
//  Created by Matheus Cadena on 2022-04-05.
//

import Foundation
import Firebase

class Authentication
{
    static func signIn(email : String, password : String,
                       successHandler : @escaping( _ userUid : String) -> Void,
                       failHandler : @escaping( _ errorMessage : String)-> Void)
    {
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if error != nil
            {
                failHandler(error!.localizedDescription)
                return
            }
            successHandler(result!.user.uid)
        }
    }
    
//    static func signUp(user : User, password : String, successHandler : @escaping( _ user : User) -> Void,
//                       failHandler : @escaping( _ errorMessage : String)-> Void)
//    {
//        Auth.auth().createUser(withEmail: user.email.lowercased(), password: password) {result, error in
//            if error != nil
//            {
////                print(error!.localizedDescription)
//                failHandler(error!.localizedDescription)
//                return
//            }
////            print(result!.user.uid)
//            user.uid = result!.user.uid //Returned by firebase authentication
//            successHandler(user)
//        }
//    }
    
    

//    static func signOut(email : String, password : String,
//                       successHandler : @escaping( _ userUid : String) -> Void,
//                       failHandler : @escaping( _ errorMessage : String)-> Void)
//    {
//        Auth.auth().signIn(withEmail: email, password: password) {result, error in
//            if error != nil
//            {
//                failHandler(error!.localizedDescription)
//                return
//            }
//            successHandler(result!.user.uid)
//        }
//    }

}

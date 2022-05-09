//
//  Student.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-05.
//

import Foundation
import Firebase
import UIKit

class Student : Codable
{
    static let collectionName = "Students"
    var uid : String?
    var firstName : String
    var lastName : String
    var email : String
    var age : String

    
    init()
    {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.age = ""
    }
    init(firstName : String, lastName : String, email : String, age : String)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.age = age
        
    }
    
    func save(successHandler : @escaping() -> Void,
              failHandler : @escaping( _ errorMessage : String) -> Void)
    {
        if self.uid == nil
        {
            failHandler("There is no UID for this student!")
            return
        }
        
        do
        {
            let data = try DictionaryEncoder().encode(self)
            Database.reference.child(Student.collectionName).child(self.uid!).setValue(data) { error, databaseReference in
                if error != nil
                {
                    failHandler(error!.localizedDescription)
                    return
                }
            }
            successHandler()
        }
        catch let err
        {
            failHandler(err.localizedDescription)
        }
    }
    
    func delete(successHandler : @escaping() -> Void,
              failHandler : @escaping( _ errorMessage : String) -> Void)
    {
        if self.uid == nil
        {
            failHandler("There is no UID for this student!")
            return
        }
        
        Database.reference.child(Student.collectionName).child(self.uid!).removeValue { error, databaseReference in
            if error != nil
            {
                failHandler(error!.localizedDescription)
                return
            }
            successHandler()
        }
        
    }
    
    static func find(uid : String, successHandler : @escaping(_ student : Student) -> Void,
                     failHandler : @escaping( _ errorMessage : String) -> Void)
    {
        Database.reference.child(Student.collectionName).child(uid).getData { error, dataSnapshot in
            if error != nil
            {
                failHandler(error!.localizedDescription)
                return
            }
            if dataSnapshot?.value == nil
            {
                failHandler("Student not found")
                return
            }
            do
            {
                let values = dataSnapshot?.value as? NSDictionary
                if values == nil
                {
                    failHandler("Student not found")
                    return
                }
                let student = try DictionaryDecoder().decode(Student.self, from: values!)
                successHandler(student)
            } catch{
                
            }
            
        }
    }
    
    static func findAll(successHandler : @escaping(_ students : [Student]) -> Void,
                     failHandler : @escaping( _ errorMessage : String) -> Void)
    {
        Database.reference.child(Student.collectionName).queryOrdered(byChild: "firstName").observeSingleEvent(of: .value) { dataSnapShot in
            var students : [Student] = []
            if(dataSnapShot.value == nil)
            {
                successHandler(students)
                return
            }
            do
            {
                for child in dataSnapShot.children.allObjects as! [DataSnapshot]
                {
                    let values = child.value as? NSDictionary
                    let student = try DictionaryDecoder().decode(Student.self, from: values!)
                    students.append(student)
                }
                successHandler(students)
            }
            catch let err
            {
                failHandler(err.localizedDescription)
            }
        }
        
    }
    
}

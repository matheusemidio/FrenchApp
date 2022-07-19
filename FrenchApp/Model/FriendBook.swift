
import Foundation
import Firebase
import UIKit

class FriendBook : Codable
{
    static let collectionName = "FriendBook"
    var uid : String?
    var email : String?
    var listOfFriends : [Student] = []
    var baseStudent = Student()
    
    init()
    {
        self.uid = ""
        self.email = ""
        self.listOfFriends.append(baseStudent)
    }
    func save(successHandler : @escaping() -> Void,
              failHandler : @escaping( _ errorMessage : String) -> Void)
    {
        if self.uid == nil
        {
            failHandler("There is no UID for this FriendBook!")
            return
        }
        
        do
        {
            let data = try DictionaryEncoder().encode(self)
            Database.reference.child(FriendBook.collectionName).child(self.uid!).setValue(data) { error, databaseReference in
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
    static func find(uid : String, successHandler : @escaping(_ friendBook : FriendBook) -> Void,
                     failHandler : @escaping( _ errorMessage : String) -> Void)
    {
        Database.reference.child(FriendBook.collectionName).child(uid).getData { error, dataSnapshot in
            if error != nil
            {
                failHandler(error!.localizedDescription)
                return
            }
            if dataSnapshot?.value == nil
            {
                failHandler("FriendBook not found")
                return
            }
            do
            {
                let values = dataSnapshot?.value as? NSDictionary
                if values == nil
                {
                    failHandler("FriendBook not found")
                    return
                }
                let friendBook = try DictionaryDecoder().decode(FriendBook.self, from: values!)
                successHandler(friendBook)
            } catch{
                
            }
            
        }
    }
    static func findAll(successHandler : @escaping(_ students : [Student]) -> Void,
                     failHandler : @escaping( _ errorMessage : String) -> Void)
    {
        Database.reference.child(FriendBook.collectionName).queryOrdered(byChild: "email").observeSingleEvent(of: .value) { dataSnapShot in
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

//
//  Contants.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-06.
//
import CoreGraphics


struct Contants
{
    static var loggedUser : Student = Student()
    static var formEntryHeight : CGFloat = 100
//    static var formEntrySpacing : CGFloat = 10
    static var formEntrySpacing : CGFloat = -20
    static var navBarItemDimension : CGFloat = 80
    static var frenchBlue : String = "FrenchBlue"
    static var frenchRed : String = "FrenchRed"
    static var heightTableViewCell : CGFloat = 80
    static var loggedFriendBook : FriendBook = FriendBook()
    static var verbPractice : String = ""
    static var tensePractice : String = ""
    static var conjugationChecker : Any = ""
    static var verbAPIConjugatedModel : Verb = Verb()
    static var verbAnswered : Verb = Verb()
    static var listOfAllStudentsSupport : [Student]?
    static var conjugationCheckerDebugger : [String : String] = [ "indicatifPresentI": "je vais",
                                                                "indicatifPresentYou": "tu vas",
                                                                "indicatifPresentHeSheIt": "il/elle/on va",
                                                                 "indicatifPresentWe": "nous allons",
                                                                 "indicatifPresentYouAll": "vous allez",
                                                                 "indicatifPresentThey": "ils/elles vont"]

    
//    static var language : String = "english"
    
//    public static func changeLanguage()
//    {
//        if(self.language == "english")
//        {
//            self.language = "french"
//        }
//        else
//        {
//            self.language = "english"
//        }
//    }
}

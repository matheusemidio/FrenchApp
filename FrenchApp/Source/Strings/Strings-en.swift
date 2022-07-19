

import Foundation
import UIKit

enum Strings_En
{
    //Debug purposes
    static let hardcodedEmail : String = ""
    static let hardcodedPassword : String = ""
    static let hardcodedPracticeVerb : String = ""
    static let hardcodedPracticeTense : String = ""

    //Entries placeholder
    static let email : String = "Email address"
    static let firstName : String = "First Name"
    static let lastName : String = "Last Name"
    static let age : String = "Age"
    static let password : String = "Password"
    static let verbSearch : String = "Search verb"
    static let tenseSearch : String = "Search tense"
    
    //Conjugation entries placeholder
    static let singFirst : String = "Je/J'ai"
    static let singSecond : String = "Tu"
    static let singThird : String = "Il/Elle/On"
    static let plurFirst : String = "Nous"
    static let plurSecond : String = "Vous"
    static let plurThird : String = "Ils/Elles"
    
    //Title of the Screens
    static let loginTitle : String = "Login"
    static let registerTitle : String = "Register"
    static let homeTitle : String = "Home"
    static let conjugateTitle : String = "Conjugate"
    static let socialTitle : String = "Social"
    static let practiceTitle : String = "Practice"
    static let profileTitle : String = "Profile"
    static let correctionTitle : String = "Correction"
    
  
    
    //Search entry placeholder
    static let searchFriend : String = "Search for a friend"

    //Toast messages
    static let ToastAuthenticationFailMessage : String = "Wrong email and password do not match."
    static let ToastAuthenticationFailTitle : String  = "Fail"
    static let ToastAddedFriendSuccessMessage : String  = "New friend added to the list."
    static let ToastAddedFriendSuccessTitle : String  = "Success"
    static let ToastUpdateProfileSuccessMessage : String  = "The student info was updated."
    static let ToastUpdateProfileSuccessTitle : String  = "Success"
    static let ToastFinishTimeMessage : String  = "Your time is up."
    static let ToastFinishTimeTitle : String  = "Finish"
    static let ToastFinishConjugationMessage : String  = "Practice finished."
    static let ToastFinishConjugationTitle : String  = "Finish"
    static let ToastLogInSuccessMessage : String  = "The log in was successful."
    static let ToastLogInSuccessTitle : String  = "Success"
    static let ToastRegisterSuccessMessage : String  = "The register was successful."
    static let ToastRegisterSuccessTitle : String  = "Success"
    static let ToastAlreadyExistMessage : String  = "The friend searched is already on the friend list."
    static let ToastAlreadyExistTitle : String  = "Fail"
    static let ToastFailVerbSearchMessage : String  = "The verb searched does not exist."
    static let ToastFailVerbSearchTitle : String  = "Fail"
    static let ToastSuccessConjugateSetupMessage : String  = "The practice is about to start."
    static let ToastSuccessConjugateSetupTitle : String  = "Success"
    static let ToastVerbAlreadyConjugatedMessage : String  = "This verb was already conjugated on your current streak."
    static let ToastVerbAlreadyConjugatedTitle : String  = "Fail"
    
    
    //Button titles
    static let buttonConjugateTitle : String  = "Conjugate now"
    static let buttonSearchTitle : String  = "Search email"
    static let buttonAddFriendTitle : String  = "Add friend"
    static let buttonUpdateTitle : String  = "Update profile"
    static let buttonSubmitTitle : String  = "Submit"
    static let buttonReturnTitle : String  = "Return"


    //Practice info labels
    static let practiceVerbLabel : String  = "Verb"
    static let practiceTenseLabel : String  = "Tense"
    
    //Conjugation modes Picker View content
    static let pickerRandomVerb : String = "Random verb"
    static let pickerSearchVerb : String = "Search verb"
    static let pickerRandomTense : String = "Random tense"
    static let pickerSearchTense : String = "Search tense"
    static let pickerPresent : String = "Present"
    static let pickerPasseSimple : String = "Passe simple"
    static let pickerImparfait : String = "Imparfait"
    static let pickerPasseCompose : String = "Passe compose"
    static let pickerFuturSimple : String = "Futur simple"
    static let pickerPasseAnterieur : String = "Passe anterieur"
    static let pickerPlusQueParfait : String = "Plus que parfait"
    static let pickerFuturAnterieur : String = "Futur anterieur"
    static let pickerTensesDict : [String : String] = ["Present" : "present", "Passe simple" : "passeSimple", "Imparfait" : "imparfait", "Passe compose" : "passeCompose", "Futur simple" : "futurSimple", "Passe anterieur" :  "passeAnterieur", "Plus que parfait" : "plusQueParfait",  "Futur anterieur" : "futurAnterieur"]


    

//    "present":{...}6 items
//    "passeSimple":{...}6 items
//    "imparfait":{...}6 items
//    "passeCompose":{...}6 items
//    "futurSimple":{...}6 items
//    "passeAnterieur":{...}6 items
//    "plusQueParfait":{...}6 items
//    "futurAnterieur"


}

enum Strings_Fr
{
    static let email : String = "Addresse e-mail"
}



import Foundation

struct Verb
{
    static let collectionName = "Verb"

    var conjugation : [String : String] = ["1Sing": "", "2Sing": "", "3Sing": "",
                       "1Plur": "", "2Plur": "", "3Plur": "" ]
    var tense : String

    init()
    {
        self.conjugation["1Sing"] = ""
        self.conjugation["2Sing"] = ""
        self.conjugation["3Sing"] = ""
        self.conjugation["1Plur"] = ""
        self.conjugation["2Plur"] = ""
        self.conjugation["3Plur"] = ""
        self.tense = ""
    }
    init(tense : String, firstSing : String, secondSing : String, thirdSing : String, firstPlur : String, secondPlur : String, thirdPlur : String)
    {
        self.conjugation["1Sing"] = firstSing
        self.conjugation["2Sing"] = secondSing
        self.conjugation["3Sing"] = thirdSing
        self.conjugation["1Plur"] = firstPlur
        self.conjugation["2Plur"] = secondPlur
        self.conjugation["3Plur"] = thirdPlur
        self.tense = tense
    }
}

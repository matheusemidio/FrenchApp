//
//  CorrectionViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-14.
//

import UIKit

class CorrectionViewController: UIViewController {

    //MARK: - Declaration of views
    public var txtSingFirst : UILabelView = UILabelView()
    public var txtSingSecond : UILabelView = UILabelView()
    public var txtSingThird : UILabelView = UILabelView()
    public var txtPlurFirst : UILabelView = UILabelView()
    public var txtPlurSecond : UILabelView = UILabelView()
    public var txtPlurThird : UILabelView = UILabelView()
    public var btnReturn : UIButton = UIButton()
    public var lblVerb : UILabel = UILabel()
    public var lblTense : UILabel = UILabel()
    public var lblSelectedVerb : UILabel = UILabel()
    public var lblSelectedTense : UILabel = UILabel()
    
    //MARK: - Declaration of variables
    public var correctionFeedback : [Bool] = Array(repeating: false, count: 6)
    
//    var myArray = Array(repeating: 0, count: 4)
    //MARK: - Declaration of outlets
    
    //MARK: - View load
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = Strings_En.correctionTitle
    }

    
    //MARK: - View initalization functions
    private func fixButton()
    {
        btnReturn.setTitle(Strings_En.buttonReturnTitle, for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnReturn.backgroundColor = UIColor(named: Contants.frenchBlue)
        btnReturn.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapReturn = UITapGestureRecognizer(target: self, action: #selector(btnReturnTouchUp))
        self.btnReturn.addGestureRecognizer(tapReturn)
        self.btnReturn.isUserInteractionEnabled = true
    }
    private func fixLabels()
    {
        lblVerb.font = UIFont.systemFont(ofSize: 30)
        lblVerb.textColor = .black
        lblVerb.textAlignment = .center
        lblVerb.text = Strings_En.practiceVerbLabel
        
        lblTense.font = UIFont.systemFont(ofSize: 30)
        lblTense.textColor = .black
        lblTense.textAlignment = .center
        lblTense.text = Strings_En.practiceTenseLabel
        
        lblSelectedVerb.font = UIFont.systemFont(ofSize: 20)
        lblSelectedVerb.textColor = .black
        lblSelectedVerb.textAlignment = .center
        lblSelectedVerb.text = Contants.verbPractice
        
        lblSelectedTense.font = UIFont.systemFont(ofSize: 20)
        lblSelectedTense.textColor = .black
        lblSelectedTense.textAlignment = .center
        lblSelectedTense.text = Contants.tensePractice
    }
    //MARK: - Initialize function
    private func initialize()
    {
        self.view.addSubviews(txtSingFirst, txtSingSecond, txtSingThird, txtPlurFirst, txtPlurSecond, txtPlurThird, btnReturn, lblVerb, lblTense,lblSelectedVerb, lblSelectedTense)
        fixButton()
        applyContraints()
        fixLabels()
        transformIntoVerbModel()
        checkCorrection()
        displayCorrectionText()
        displayCorrectionColors()
        checkSreakImplementation()
    }
    //MARK: - Applying constraints
    private func applyContraints()
    {
        txtSingFirst.translatesAutoresizingMaskIntoConstraints = false
        txtSingSecond.translatesAutoresizingMaskIntoConstraints = false
        txtSingThird.translatesAutoresizingMaskIntoConstraints = false
        txtPlurFirst.translatesAutoresizingMaskIntoConstraints = false
        txtPlurSecond.translatesAutoresizingMaskIntoConstraints = false
        txtPlurThird.translatesAutoresizingMaskIntoConstraints = false
        btnReturn.translatesAutoresizingMaskIntoConstraints = false
        lblVerb.translatesAutoresizingMaskIntoConstraints = false
        lblTense.translatesAutoresizingMaskIntoConstraints = false
        lblSelectedVerb.translatesAutoresizingMaskIntoConstraints = false
        lblSelectedTense.translatesAutoresizingMaskIntoConstraints = false
        
        lblVerb.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        lblVerb.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        lblVerb.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        lblVerb.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblTense.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        lblTense.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        lblTense.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        lblTense.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblSelectedVerb.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        lblSelectedVerb.topAnchor.constraint(equalTo: lblVerb.bottomAnchor).isActive = true
        lblSelectedVerb.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        lblSelectedVerb.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblSelectedTense.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        lblSelectedTense.topAnchor.constraint(equalTo: lblTense.bottomAnchor).isActive = true
        lblSelectedTense.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        lblSelectedTense.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        txtSingFirst.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtSingFirst.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtSingFirst.topAnchor.constraint(equalTo: lblSelectedVerb.bottomAnchor).isActive = true
        txtSingFirst.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtSingSecond.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtSingSecond.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtSingSecond.topAnchor.constraint(equalTo: txtSingFirst.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtSingSecond.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true

        txtSingThird.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtSingThird.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtSingThird.topAnchor.constraint(equalTo: txtSingSecond.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtSingThird.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtPlurFirst.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtPlurFirst.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtPlurFirst.topAnchor.constraint(equalTo: txtSingThird.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtPlurFirst.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtPlurSecond.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtPlurSecond.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtPlurSecond.topAnchor.constraint(equalTo: txtPlurFirst.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtPlurSecond.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtPlurThird.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtPlurThird.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtPlurThird.topAnchor.constraint(equalTo: txtPlurSecond.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtPlurThird.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true

        btnReturn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        btnReturn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        btnReturn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        btnReturn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    //MARK: - Navbar Action Handlers
    @objc func btnReturnTouchUp()
    {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let conjugateViewController = main.instantiateViewController(withIdentifier: Segue.ConjugateViewController)
        show(conjugateViewController, sender: self)

        print("Return tapped")
    }
    
    
    
    //MARK: - Transform into model architecture
    func transformIntoVerbModel()
    {
        var verbCorrectionModel = Verb()
        verbCorrectionModel.tense = Contants.tensePractice
        
//MARK: - Change this after debug
        var conjugationCheckerSupport = Contants.conjugationChecker as! [String : String]
//        var conjugationCheckerSupport = Contants.conjugationCheckerDebugger as! [String : String]

        var comparissonStringNormal : String = ""
        let lowerBoundNormal = String.Index(encodedOffset: 0)
        let upperBoundNormal = String.Index(encodedOffset: 1)
        
        var comparissonStringException : String = ""
        let lowerBoundException = String.Index(encodedOffset: 0)
        let upperBoundException = String.Index(encodedOffset: 3)
        
        for (key, value) in conjugationCheckerSupport
        {
            comparissonStringNormal = String(value[lowerBoundNormal..<upperBoundNormal])
            comparissonStringException = String(value[lowerBoundException..<upperBoundException])

            switch(comparissonStringNormal)
            {
            case "j":
                verbCorrectionModel.conjugation["1Sing"] = value
                break
            case "t":
                verbCorrectionModel.conjugation["2Sing"] = value
                break
            case "n":
                verbCorrectionModel.conjugation["1Plur"] = value
                break
            case "v":
                verbCorrectionModel.conjugation["2Plur"] = value
                break
            default:
                break
            }
            switch(comparissonStringException)
            {
            case "il/":
                verbCorrectionModel.conjugation["3Sing"] = value
                break
            case "ils":
                verbCorrectionModel.conjugation["3Plur"] = value
                break
            default:
                break
            }
        }
        Contants.verbAPIConjugatedModel = verbCorrectionModel
    }
    
    //MARK: - Check corrections
    private func checkCorrection()
    {
        var userAnswerDebug = Contants.verbAnswered.conjugation
        var apiAnswerDebug = Contants.verbAPIConjugatedModel.conjugation
        
        self.correctionFeedback[0] = Contants.verbAPIConjugatedModel.conjugation["1Sing"] == Contants.verbAnswered.conjugation["1Sing"] ? true : false
        self.correctionFeedback[1] = Contants.verbAPIConjugatedModel.conjugation["2Sing"] == Contants.verbAnswered.conjugation["2Sing"] ? true : false
        self.correctionFeedback[2] = Contants.verbAPIConjugatedModel.conjugation["3Sing"] == Contants.verbAnswered.conjugation["3Sing"] ? true : false
        self.correctionFeedback[3] = Contants.verbAPIConjugatedModel.conjugation["1Plur"] == Contants.verbAnswered.conjugation["1Plur"] ? true : false
        self.correctionFeedback[4] = Contants.verbAPIConjugatedModel.conjugation["2Plur"] == Contants.verbAnswered.conjugation["2Plur"] ? true : false
        self.correctionFeedback[5] = Contants.verbAPIConjugatedModel.conjugation["3Plur"] == Contants.verbAnswered.conjugation["3Plur"] ? true : false

//        if(Contants.verbAPIConjugatedModel.conjugation[] == Contants.verbAnswered.conjugation[])
//        {
//            self.correctionFeedback[0] = true
//        }
    }
    
    //MARK: - Correction modifiers
    func displayCorrectionColors()
    {
        self.txtSingFirst.txtEntry.backgroundColor = self.correctionFeedback[0] == true ? .green : .red
        self.txtSingSecond.txtEntry.backgroundColor = self.correctionFeedback[1] == true ? .green : .red
        self.txtSingThird.txtEntry.backgroundColor = self.correctionFeedback[2] == true ? .green : .red
        self.txtPlurFirst.txtEntry.backgroundColor = self.correctionFeedback[3] == true ? .green : .red
        self.txtPlurSecond.txtEntry.backgroundColor = self.correctionFeedback[4] == true ? .green : .red
        self.txtPlurThird.txtEntry.backgroundColor = self.correctionFeedback[5] == true ? .green : .red

    }
    func displayCorrectionText()
    {
        self.txtSingFirst.newText = Contants.verbAPIConjugatedModel.conjugation["1Sing"]!
        self.txtSingSecond.newText = Contants.verbAPIConjugatedModel.conjugation["2Sing"]!
        self.txtSingThird.newText = Contants.verbAPIConjugatedModel.conjugation["3Sing"]!
        self.txtPlurFirst.newText = Contants.verbAPIConjugatedModel.conjugation["1Plur"]!
        self.txtPlurSecond.newText = Contants.verbAPIConjugatedModel.conjugation["2Plur"]!
        self.txtPlurThird.newText = Contants.verbAPIConjugatedModel.conjugation["3Plur"]!

    }
     
    func checkSreakImplementation()
    {
        var allAnswersCorrect = true
        for element in self.correctionFeedback
        {
            if(element == false)
            {
                allAnswersCorrect = false
            }
        }
        
        if(allAnswersCorrect == true)
        {
            //Increment users streak number
            Contants.loggedUser.conjugationStreak += 1
            //Add verb to user's list of verbs
            Contants.loggedUser.listOfVerbs.append(Contants.verbPractice)
        }
        else
        {
            //Set the conjugation streak to zero
            Contants.loggedUser.conjugationStreak = 0
            
            //Remove the verbs from the list of verbs conjugated
            Contants.loggedUser.listOfVerbs.removeAll()
            Contants.loggedUser.listOfVerbs.append("")
        }
        Contants.loggedUser.save(successHandler: saveUserSucessHandler, failHandler: saveUserFailHandler)

    }
    
    //MARK: - Save User action handlers
    func saveUserSucessHandler()
    {
        print("The new student was saved")
 
    }
    func saveUserFailHandler(_ errorMessage : String)
    {
        print("SaveFail -> \(errorMessage)")
    }

}



import UIKit

class PracticeViewController: UIViewController {

    //MARK: - Declaration of views
    public var txtSingFirst : UIEntryView = UIEntryView()
    public var txtSingSecond : UIEntryView = UIEntryView()
    public var txtSingThird : UIEntryView = UIEntryView()
    public var txtPlurFirst : UIEntryView = UIEntryView()
    public var txtPlurSecond : UIEntryView = UIEntryView()
    public var txtPlurThird : UIEntryView = UIEntryView()
//    public var btnSubmit : UIButton = UIButton()
    public var progressView : UIProgressTimerView = UIProgressTimerView()
    public var lblVerb : UILabel = UILabel()
    public var lblTense : UILabel = UILabel()
    public var lblSelectedVerb : UILabel = UILabel()
    public var lblSelectedTense : UILabel = UILabel()
    public var timer : Timer = Timer()

    
    //MARK: - Declaration of variables
    var verbData = Strings_En.hardcodedPracticeVerb
    var tenseData = Strings_En.hardcodedPracticeTense
//    var verbData : String?
//    var tenseData : String?
    
    //MARK: - Declaration of outlets
    
    //MARK: - View load
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = Strings_En.practiceTitle
        // Do any additional setup after loading the view.
    }
    //MARK: - View initalization functions
    private func setPlaceholders()
    {
        txtSingFirst.title = Strings_En.singFirst
        txtSingSecond.title = Strings_En.singSecond
        txtSingThird.title = Strings_En.singThird
        txtPlurFirst.title = Strings_En.plurFirst
        txtPlurSecond.title = Strings_En.plurSecond
        txtPlurThird.title = Strings_En.plurThird
        
        txtSingFirst.capitalizationType = .none
        txtSingSecond.capitalizationType = .none
        txtSingThird.capitalizationType = .none
        txtPlurFirst.capitalizationType = .none
        txtPlurSecond.capitalizationType = .none
        txtPlurThird.capitalizationType = .none

    }
//    private func fixButton()
//    {
//        btnSubmit.setTitle(Strings_En.buttonSubmitTitle, for: .normal)
////        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
//        btnSubmit.backgroundColor = UIColor(named: Contants.frenchBlue)
//        btnSubmit.titleLabel?.font =  UIFont(name: "...", size: 30)
//
//        let tapSubmit = UITapGestureRecognizer(target: self, action: #selector(btnSubmitTouchUp))
//        self.btnSubmit.addGestureRecognizer(tapSubmit)
//        self.btnSubmit.isUserInteractionEnabled = true
//    }
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
    //MARK: - Timer function for progressView
    func startTimer()
    {
        var isDone = false
        self.progressView.setProgress = 1
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            DispatchQueue.main.async
            {
                self.progressView.setProgress -= 0.025
            }
            if self.progressView.progressBar.progress <= 0
            {
                timer.invalidate()
                Toast.show(view: self, title: Strings_En.ToastFinishTimeTitle, message: Strings_En.ToastFinishTimeMessage )
                self.getAnswers()
                self.goToNextScreen()
            }
        })
        
    }

    //MARK: - Initialize function
    private func initialize()
    {
        self.view.addSubviews(txtSingFirst, txtSingSecond, txtSingThird, txtPlurFirst, txtPlurSecond, txtPlurThird, lblVerb, lblTense,lblSelectedVerb, lblSelectedTense, progressView)
//        fixButton()
        setPlaceholders()
        applyContraints()
        fixLabels()
        startTimer()
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
//        btnSubmit.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
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

        progressView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        progressView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        progressView.topAnchor.constraint(equalTo: txtPlurThird.bottomAnchor).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 20).isActive = true

//        btnSubmit.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        btnSubmit.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
////        btnSubmit.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
//        btnSubmit.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 5).isActive = true
//        btnSubmit.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
//    //MARK: - Submit action handlers
//    @objc func btnSubmitTouchUp()
//    {
//        getAnswers()
//        Toast.show(view: self, title: Strings_En.ToastFinishTimeTitle, message: Strings_En.ToastFinishConjugationMessage )
//        //Pass the answers, verb and tense selected
////        let main = UIStoryboard(name: "Main", bundle: nil)
////        let correctionViewController = main.instantiateViewController(withIdentifier: Segue.CorrectionViewController)
////        show(correctionViewController, sender: self)
////        print("Submit tapped")
//        goToNextScreen()
//    }
    
    //MARK: - Get Answers action handler
    func getAnswers()
    {
        let singFirst = txtSingFirst.txtEntry.text != nil ? txtSingFirst.txtEntry.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) : ""
        let singSecond = txtSingSecond.txtEntry.text != nil ? txtSingSecond.txtEntry.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)  : ""
        let singThird = txtSingThird.txtEntry.text != nil ? txtSingThird.txtEntry.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)  : ""
        let plurFirst = txtPlurFirst.txtEntry.text != nil ? txtPlurFirst.txtEntry.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)  : ""
        let plurSecond = txtPlurSecond.txtEntry.text != nil ? txtPlurSecond.txtEntry.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)  : ""
        let plurThird = txtPlurThird.txtEntry.text != nil ? txtPlurThird.txtEntry.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)  : ""
        
        //To correct the problem with the required il/elle/on
//        let ilLowerBound = String.Index(encodedOffset: 0)
//        let ilUpperBound = String.Index(encodedOffset: 2)
//        var ilSupport = ""
//        ilSupport = String(singThird![ilLowerBound..<ilUpperBound])
//
//        let elleLowerBound = String.Index(encodedOffset: 0)
//        let elleUpperBound = String.Index(encodedOffset: 4)
//        var elleSupport = ""
//        elleSupport = String(singThird![elleLowerBound..<elleUpperBound])
//
//        let onULowerBound = String.Index(encodedOffset: 0)
//        let onUpperBound = String.Index(encodedOffset: 2)
//        var onSupport = ""
//        onSupport = String(singThird![onULowerBound..<onUpperBound])
//
//        
//        let ilsLowerBound = String.Index(encodedOffset: 0)
//        let ilsUpperBound = String.Index(encodedOffset: 4)
//        var ilsSupport = ""
//        ilsSupport = String(plurThird![ilsLowerBound..<ilsUpperBound])
//
//        
//        let ellesLowerBound = String.Index(encodedOffset: 0)
//        let ellesUpperBound = String.Index(encodedOffset: 5)
//        var ellesSupport = ""
//        ellesSupport = String(plurThird![ellesLowerBound..<ellesUpperBound])

        
//        comparissonStringException = String(value[lowerBoundException..<upperBoundException])

        
        let verb : Verb = Verb(tense: Contants.tensePractice, firstSing: singFirst!, secondSing: singSecond!, thirdSing: singThird!, firstPlur: plurFirst!, secondPlur: plurSecond!, thirdPlur: plurThird!)
        Contants.verbAnswered = verb
    }
    
    func goToNextScreen()
    {
        var counter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            //Call function to submit programatically
            counter += 1
            if(counter >= 3)
            {
                timer.invalidate()
                let main = UIStoryboard(name: "Main", bundle: nil)
                let correctionViewController = main.instantiateViewController(withIdentifier: Segue.CorrectionViewController)
                self.show(correctionViewController, sender: self)
            }
      
        })
    }
    

}

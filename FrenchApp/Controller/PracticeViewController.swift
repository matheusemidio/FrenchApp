//
//  PracticeViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-12.
//

import UIKit

class PracticeViewController: UIViewController {

    //MARK: - Declaration of views
    public var txtSingFirst : UIEntryView = UIEntryView()
    public var txtSingSecond : UIEntryView = UIEntryView()
    public var txtSingThird : UIEntryView = UIEntryView()
    public var txtPlurFirst : UIEntryView = UIEntryView()
    public var txtPlurSecond : UIEntryView = UIEntryView()
    public var txtPlurThird : UIEntryView = UIEntryView()
    public var btnSubmit : UIButton = UIButton()
    public var progressView : UIProgressTimerView = UIProgressTimerView()
    public var lblVerb : UILabel = UILabel()
    public var lblTense : UILabel = UILabel()
    public var lblSelectedVerb : UILabel = UILabel()
    public var lblSelectedTense : UILabel = UILabel()
    
    //MARK: - Declaration of variables
    var timer : Timer = Timer()
    //MARK: - Declaration of outlets
    
    //MARK: - View load and initialization of entries
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = Strings_En.practiceTitle
        // Do any additional setup after loading the view.
    }
    private func setPlaceholders()
    {
        txtSingFirst.title = Strings_En.singFirst
        txtSingSecond.title = Strings_En.singSecond
        txtSingThird.title = Strings_En.singThird
        txtPlurFirst.title = Strings_En.plurFirst
        txtPlurSecond.title = Strings_En.plurSecond
        txtPlurThird.title = Strings_En.plurThird
        
    }
    private func fixButton()
    {
        btnSubmit.setTitle("Submit", for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnSubmit.backgroundColor = UIColor(named: Contants.frenchBlue)
        btnSubmit.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapSubmit = UITapGestureRecognizer(target: self, action: #selector(btnSubmitTouchUp))
        self.btnSubmit.addGestureRecognizer(tapSubmit)
        self.btnSubmit.isUserInteractionEnabled = true
    }
    private func fixLabels()
    {
        lblVerb.font = UIFont.systemFont(ofSize: 30)
        lblVerb.textColor = .black
        lblVerb.textAlignment = .center
        lblVerb.text = "Verb"
        
        lblTense.font = UIFont.systemFont(ofSize: 30)
        lblTense.textColor = .black
        lblTense.textAlignment = .center
        lblTense.text = "Tense"
        
        lblSelectedVerb.font = UIFont.systemFont(ofSize: 20)
        lblSelectedVerb.textColor = .black
        lblSelectedVerb.textAlignment = .center
        lblSelectedVerb.text = "Avoir"
        
        lblSelectedTense.font = UIFont.systemFont(ofSize: 20)
        lblSelectedTense.textColor = .black
        lblSelectedTense.textAlignment = .center
        lblSelectedTense.text = "Present"
    }
    func startTimer()
    {
        self.progressView.setProgress = 0.0
        var progress : Float = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            progress += 0.0001
            self.progressView.setProgress = progress
            
        })
        
        
    }

    //MARK: - Initialize and constraints
    private func initialize()
    {
        self.view.addSubviews(txtSingFirst, txtSingSecond, txtSingThird, txtPlurFirst, txtPlurSecond, txtPlurThird, btnSubmit, lblVerb, lblTense,lblSelectedVerb, lblSelectedTense, progressView)
        fixButton()
        setPlaceholders()
        applyContraints()
        fixLabels()
    }
    private func applyContraints()
    {
        txtSingFirst.translatesAutoresizingMaskIntoConstraints = false
        txtSingSecond.translatesAutoresizingMaskIntoConstraints = false
        txtSingThird.translatesAutoresizingMaskIntoConstraints = false
        txtPlurFirst.translatesAutoresizingMaskIntoConstraints = false
        txtPlurSecond.translatesAutoresizingMaskIntoConstraints = false
        txtPlurThird.translatesAutoresizingMaskIntoConstraints = false
        btnSubmit.translatesAutoresizingMaskIntoConstraints = false
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

        btnSubmit.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        btnSubmit.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        btnSubmit.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        btnSubmit.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 5).isActive = true
        btnSubmit.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    //MARK: - Navbar Action Handlers
    @objc func btnSubmitTouchUp()
    {
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let conjugateViewController = main.instantiateViewController(withIdentifier: Segue.ConjugateViewController)
//        show(conjugateViewController, sender: self)
        guard let singFirst = txtSingFirst.txtEntry.text, singFirst != "" else
        {
            btnSubmit.shakeWith(txtSingFirst)
            return
        }
        guard let singSecond = txtSingSecond.txtEntry.text, singSecond != "" else
        {
            btnSubmit.shakeWith(txtSingSecond)
            return
        }
        guard let singThird = txtSingThird.txtEntry.text, singThird != "" else
        {
            btnSubmit.shakeWith(txtSingThird)
            return
        }
        guard let plurFirst = txtPlurFirst.txtEntry.text, plurFirst != "" else
        {
            btnSubmit.shakeWith(txtPlurFirst)
            return
        }
        guard let plurSecond = txtPlurSecond.txtEntry.text, plurSecond != "" else
        {
            btnSubmit.shakeWith(txtPlurSecond)
            return
        }
        guard let plurThird = txtPlurThird.txtEntry.text, plurThird != "" else
        {
            btnSubmit.shakeWith(txtPlurThird)
            return
        }
        
        //Pass the answers, verb and tense selected
        let main = UIStoryboard(name: "Main", bundle: nil)
        let correctionViewController = main.instantiateViewController(withIdentifier: Segue.CorrectionViewController)
        show(correctionViewController, sender: self)
        print("Submit tapped")
    }
    

}
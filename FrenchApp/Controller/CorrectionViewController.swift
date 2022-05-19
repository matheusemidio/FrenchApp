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
        lblSelectedVerb.text = Strings_En.hardcodedPracticeVerb
        
        lblSelectedTense.font = UIFont.systemFont(ofSize: 20)
        lblSelectedTense.textColor = .black
        lblSelectedTense.textAlignment = .center
        lblSelectedTense.text = Strings_En.hardcodedPracticeTense
    }
    //MARK: - Initialize function
    private func initialize()
    {
        self.view.addSubviews(txtSingFirst, txtSingSecond, txtSingThird, txtPlurFirst, txtPlurSecond, txtPlurThird, btnReturn, lblVerb, lblTense,lblSelectedVerb, lblSelectedTense)
        fixButton()
        checkCorrection()
        applyContraints()
        fixLabels()
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
    //MARK: - Check correction function
    private func checkCorrection()
    {
//        txtSingFirst.title = Strings_En.singFirst
//        txtSingSecond.title = Strings_En.singSecond
//        txtSingThird.title = Strings_En.singThird
//        txtPlurFirst.title = Strings_En.plurFirst
//        txtPlurSecond.title = Strings_En.plurSecond
//        txtPlurThird.title = Strings_En.plurThird
    }

}

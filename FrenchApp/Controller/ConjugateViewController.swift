//
//  ConjugateViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-10.
//

import UIKit

class ConjugateViewController: UIViewController, UINavbarDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: - Declaration of views
    public var navbar : UINavbar = UINavbar()
    public var txtVerb : UIEntryView = UIEntryView()
//    public var txtTense : UIEntryView = UIEntryView()
    public var btnConjugate : UIButton = UIButton()
    public var timer : Timer = Timer()


    //MARK: - Declaration of variables
    var pickerData : [[String]] = [[Strings_En.pickerRandomVerb, Strings_En.pickerSearchVerb],
                                   [Strings_En.pickerRandomTense, Strings_En.pickerPresent, Strings_En.pickerPasseSimple, Strings_En.pickerImparfait, Strings_En.pickerPasseCompose, Strings_En.pickerFuturSimple, Strings_En.pickerPasseAnterieur, Strings_En.pickerPlusQueParfait, Strings_En.pickerFuturAnterieur]]

    
    var verbMode : String = Strings_En.pickerRandomVerb
    var tenseMode : String = Strings_En.pickerRandomTense
    var verbSelection : [Int] = []
    var tenseSelection : [Int] = []
    var alreadyClicked : Bool = false
    var verbToBeConjugated : String = ""
    var tenseToBeConjugated : String = ""
    
    //MARK: - Declaration of outlets
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    
    
    //MARK: - View load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        self.title = Strings_En.conjugateTitle

        self.pickerViewOutlet.delegate = self
        self.pickerViewOutlet.dataSource = self
    }
    
    //MARK: - View initalization functions
    private func setPlaceholders()
    {
        txtVerb.title = Strings_En.verbSearch
//        txtTense.title = Strings_En.tenseSearch
        txtVerb.isHidden = true
//        txtTense.isHidden = true

    }
    private func fixButton()
    {
        btnConjugate.setTitle(Strings_En.buttonConjugateTitle, for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnConjugate.backgroundColor = UIColor(named: Contants.frenchBlue)
        btnConjugate.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapConjugate = UITapGestureRecognizer(target: self, action: #selector(btnConjugateTouchUp))
        self.btnConjugate.addGestureRecognizer(tapConjugate)
        self.btnConjugate.isUserInteractionEnabled = true
    }
    
    //MARK: - Initialize function
    private func initialize()
    {
        setPlaceholders()
        fixButton()
        self.view.addSubviews(navbar, txtVerb, btnConjugate)
        self.navbar.delegate = self
        applyContraints()
        self.alreadyClicked = false
    }
    
    //MARK: - Applying constraints
    private func applyContraints()
    {
        btnConjugate.translatesAutoresizingMaskIntoConstraints = false
//        txtTense.translatesAutoresizingMaskIntoConstraints = false
        txtVerb.translatesAutoresizingMaskIntoConstraints = false
        navbar.translatesAutoresizingMaskIntoConstraints = false
        
        navbar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navbar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        navbar.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navbar.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        btnConjugate.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        btnConjugate.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        btnConjugate.bottomAnchor.constraint(equalTo: navbar.topAnchor, constant: -20).isActive = true
        btnConjugate.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
//        txtTense.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        txtTense.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        txtTense.bottomAnchor.constraint(equalTo: btnConjugate.topAnchor, constant: -100).isActive = true
//        txtTense.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtVerb.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtVerb.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtVerb.bottomAnchor.constraint(equalTo: btnConjugate.topAnchor, constant: -80).isActive = true
        txtVerb.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
    }
    
    //MARK: - Navbar Action Handlers
    func conjugateTapped()
    {
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let conjugateViewController = main.instantiateViewController(withIdentifier: Segue.ConjugateViewController)
//        show(conjugateViewController, sender: self)
//
        print("Conjugate tapped")
    }
    func profileTapped()
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = main.instantiateViewController(withIdentifier: Segue.ProfileViewController)
        show(profileViewController, sender: self)
//        present(profileViewController, animated: false, completion: nil)
        print("Profile tapped")
    }
    func socialTapped()
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let socialViewController = main.instantiateViewController(withIdentifier: Segue.SocialViewController)
        show(socialViewController, sender: self)
        print("Social tapped")
    }
    func homeTapped()
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = main.instantiateViewController(withIdentifier: Segue.HomeViewController)
        show(homeViewController, sender: self)
        print("Home tapped")
    }
    
    //MARK: - Picker View functions
    //Number of collumns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //The numbers of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }

    //Data for the rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    //Get the selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch(component)
        {
        case 0:
            self.verbMode = pickerData[component][row]
            self.verbSelection = [component, row]
            break
        case 1:
            self.tenseMode = pickerData[component][row]
            self.tenseSelection = [component, row]
            break
        default:
            self.tenseMode = ""
            break
        }
//        if(pickerData[component][row] == Strings_En.pickerRandomTense || pickerData[component][row] == Strings_En.pickerSearchTense)
//        {
//            self.tenseMode = pickerData[component][row]
//            self.tenseSelection = [component, row]
//        }else if(pickerData[component][row] == Strings_En.pickerRandomVerb || pickerData[component][row] == Strings_En.pickerSearchVerb)
//        {
//            self.verbMode = pickerData[component][row]
//            self.verbSelection = [component, row]
//        }

        print("\nVerb mode ->" + self.verbMode)
        print("Tense mode ->" + self.tenseMode)
    }

    //MARK: - Conjugate action handlers
    @objc func btnConjugateTouchUp()
    {
        if(self.tenseMode == Strings_En.pickerRandomTense)
        {
            //Perform the random choice
            let n = Int.random(in: 1...8)
            self.tenseToBeConjugated = pickerData[1][n]
        }
        else
        {
            self.tenseToBeConjugated = self.tenseMode
        }
        Contants.tensePractice = self.tenseToBeConjugated
//        practiceViewControlerData.tenseData = self.tenseToBeConjugated
        
        if(txtVerb.isHidden == true)
        {
            
            if(self.verbMode == Strings_En.pickerSearchVerb)
            {
                txtVerb.isHidden = false
            }
            else if(self.verbMode == Strings_En.pickerRandomVerb)
            {
                //Get random verb and perform segue
                let n = Int.random(in: 0...ExistingVerbsList.arrayOfVerbs.count)
                self.verbToBeConjugated = ExistingVerbsList.arrayOfVerbs[n]
                Contants.verbPractice = self.verbToBeConjugated
                Toast.show(view: self, title: Strings_En.ToastSuccessConjugateSetupTitle, message: Strings_En.ToastSuccessConjugateSetupMessage)
                goToNextScreen()

//                show(practiceViewController, sender: self)
            }
           
            self.alreadyClicked = true
            return
        }
        else if(txtVerb.isHidden == false && self.alreadyClicked == true)
        {
            guard let verbSearched = txtVerb.txtEntry.text, verbSearched != "" else
            {
                btnConjugate.shakeWith(txtVerb)
                return
            }
            //Toast.show(view: self, title: "Debug", message: "Second click -> Ready to perform the segue")
            //Before performing the Segue, get the API verb and tense for the next screen
            //Also, check and verify if the searched was valid
//            practiceViewControlerData.verbData = verbSearched
            var verbExist = false
            for verb in ExistingVerbsList.arrayOfVerbs
            {
                if(verbSearched.lowercased() == verb)
                {
                    verbExist = true
                }
            }
            if(verbExist == true)
            {
                Toast.show(view: self, title: Strings_En.ToastSuccessConjugateSetupTitle, message: Strings_En.ToastSuccessConjugateSetupMessage)

                Contants.verbPractice = verbSearched
//                show(practiceViewController, sender: self)
                goToNextScreen()
            }
            else
            {
                Toast.show(view: self, title: Strings_En.ToastFailVerbSearchTitle, message: Strings_En.ToastFailVerbSearchMessage)
            }
            
            
        }
        
        //MARK: - Segue
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
                    let practiceViewController = main.instantiateViewController(withIdentifier: Segue.PracticeViewController)
                    self.show(practiceViewController, sender: self)
                }
          
            })
        }

        
//        if(txtVerb.isHidden == true && txtTense.isHidden == true)
//        {
//            if(self.verbMode == Strings_En.pickerSearchVerb)
//            {
//                txtVerb.isHidden = false
//            }
//            if(self.tenseMode == Strings_En.pickerSearchTense)
//            {
//                txtTense.isHidden = false
//            }
//            else if((self.verbMode == Strings_En.pickerRandomVerb) && (self.tenseMode == Strings_En.pickerRandomTense))
//            {
////                Toast.show(view: self, title: "Debug", message: "Random -> Ready to perform the segue.")
//                //Before performing the Segue, get the API verb and tense for the next screen
//                show(practiceViewController, sender: self)
//                
//            }
//            self.alreadyClicked = true
//            return
//        }
//        else if((txtVerb.isHidden == false || txtTense.isHidden == false) && self.alreadyClicked == true)
//        {
//            if(txtVerb.isHidden == false)
//            {
//                guard let verbSearched = txtVerb.txtEntry.text, verbSearched != "" else
//                {
//                    btnConjugate.shakeWith(txtVerb)
//                    return
//                }
//            }
//            else if(txtTense.isHidden == false)
//            {
//                guard let tenseSearched = txtTense.txtEntry.text, tenseSearched != "" else
//                {
//                    btnConjugate.shakeWith(txtTense)
//                    return
//                }
//            }
//
////            Toast.show(view: self, title: "Debug", message: "Second click -> Ready to perform the segue")
//            //Before performing the Segue, get the API verb and tense for the next screen
//            //Also, check and verify if the searched was valid
//            show(practiceViewController, sender: self)
//
//        }
        
    }

}

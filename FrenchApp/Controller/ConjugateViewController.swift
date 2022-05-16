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
    public var txtTense : UIEntryView = UIEntryView()
    public var btnConjugate : UIButton = UIButton()

    //MARK: - Declaration of variables
    var pickerData : [[String]] = [[Strings_En.pickerRandomVerb, Strings_En.pickerSearchVerb],
                                   [Strings_En.pickerRandomTense, Strings_En.pickerSearchTense]]
    var verbMode : String = Strings_En.pickerRandomVerb
    var tenseMode : String = Strings_En.pickerRandomTense
    var verbSelection : [Int] = []
    var tenseSelection : [Int] = []
    var alreadyClicked : Bool = false
    
    //MARK: - Declaration of outlets
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    
    //MARK: - View load and initialization of entries
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        self.title = Strings_En.conjugateTitle

        self.pickerViewOutlet.delegate = self
        self.pickerViewOutlet.dataSource = self
    }
    private func setPlaceholders()
    {
        txtVerb.title = Strings_En.verbSearch
        txtTense.title = Strings_En.tenseSearch
        txtVerb.isHidden = true
        txtTense.isHidden = true

    }
    private func fixButton()
    {
        btnConjugate.setTitle("Conjugate", for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnConjugate.backgroundColor = UIColor(named: Contants.frenchBlue)
        btnConjugate.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapConjugate = UITapGestureRecognizer(target: self, action: #selector(btnConjugateTouchUp))
        self.btnConjugate.addGestureRecognizer(tapConjugate)
        self.btnConjugate.isUserInteractionEnabled = true
    }
    
    //MARK: - Initialize and constraints
    private func initialize()
    {
        setPlaceholders()
        fixButton()
        self.view.addSubviews(navbar, txtVerb, txtTense, btnConjugate)
        self.navbar.delegate = self
        applyContraints()
        self.alreadyClicked = false
    }
    private func applyContraints()
    {
        btnConjugate.translatesAutoresizingMaskIntoConstraints = false
        txtTense.translatesAutoresizingMaskIntoConstraints = false
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
        
        txtTense.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtTense.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtTense.bottomAnchor.constraint(equalTo: btnConjugate.topAnchor, constant: -100).isActive = true
        txtTense.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtVerb.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtVerb.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtVerb.bottomAnchor.constraint(equalTo: txtTense.topAnchor, constant: Contants.formEntrySpacing).isActive = true
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
        return pickerData.count
    }

    //Data for the rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if(self.alreadyClicked == true && row == 0)
//        {
//            Toast.show(view: self, title: "Debug", message: "Returning your selection on Verb mode")
//            return pickerData[self.verbSelection[0]][self.verbSelection[1]]
//        }
//        else if(self.alreadyClicked == true && row == 1)
//        {
//            Toast.show(view: self, title: "Debug", message: "Returning your selection on Tense mode")
//            return pickerData[self.tenseSelection[0]][self.tenseSelection[1]]
//        }
        return pickerData[component][row]
    }
    
    //Get the selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerData[component][row] == "Random tense" || pickerData[component][row] == "Search tense")
        {
            self.tenseMode = pickerData[component][row]
            self.tenseSelection = [component, row]
        }else if(pickerData[component][row] == "Random verb" || pickerData[component][row] == "Search verb")
        {
            self.verbMode = pickerData[component][row]
            self.verbSelection = [component, row]
        }

        print("\nVerb mode ->" + self.verbMode)
        print("Tense mode ->" + self.tenseMode)
    }


//    @IBAction func btnSubmitTouchUp(_ sender: Any)
//    {
//        //print(self.modeSelection!)
//        if(self.verbMode == "Random")
//        {
////            self.performSegue(withIdentifier: Segue.toPracticeQuestion, sender: nil)
//        } else if(self.verbMode == "Manual")
//        {
////            self.performSegue(withIdentifier: Segue.toNewQuestion, sender: nil)
//        }
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == Segue.toPracticeQuestion)
//        {
//            let practiceQuestionViewController  = (segue.destination as! PracticeQuestionViewController)
//            practiceQuestionViewController.typeData = self.typeSelection
//        }else if(segue.identifier == Segue.toNewQuestion)
//        {
//            let newQuestionViewController = (segue.destination as! NewQuestionViewController)
//            newQuestionViewController.typeData = self.typeSelection
//        }
//    }

    //MARK: - Update action handler
    @objc func btnConjugateTouchUp()
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let practiceViewController = main.instantiateViewController(withIdentifier: Segue.PracticeViewController)
        if(txtVerb.isHidden == true && txtTense.isHidden == true)
        {
            if(self.verbMode == "Search verb")
            {
                txtVerb.isHidden = false
            }
            if(self.tenseMode == "Search tense")
            {
                txtTense.isHidden = false
            }
            else if((self.verbMode == "Random verb") && (self.tenseMode == "Random tense"))
            {
//                Toast.show(view: self, title: "Debug", message: "Random -> Ready to perform the segue.")
                //Before performing the Segue, get the API verb and tense for the next screen
                show(practiceViewController, sender: self)
                

            }
            self.alreadyClicked = true
            return
        }
        else if((txtVerb.isHidden == false || txtTense.isHidden == false) && self.alreadyClicked == true)
        {
            if(txtVerb.isHidden == false)
            {
                guard let verbSearched = txtVerb.txtEntry.text, verbSearched != "" else
                {
                    btnConjugate.shakeWith(txtVerb)
                    return
                }
            }
            else if(txtTense.isHidden == false)
            {
                guard let tenseSearched = txtTense.txtEntry.text, tenseSearched != "" else
                {
                    btnConjugate.shakeWith(txtTense)
                    return
                }
            }
            
//            Toast.show(view: self, title: "Debug", message: "Second click -> Ready to perform the segue")
            //Before performing the Segue, get the API verb and tense for the next screen
            //Also, check and verify if the searched was valid
            show(practiceViewController, sender: self)
            
        }
        
    }

}

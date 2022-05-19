//
//  ProfileViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-10.
//

import UIKit

class ProfileViewController: UIViewController , UINavbarDelegate{

    //MARK: - Declaration of views
    public var navbar : UINavbar = UINavbar()
    public var txtEmail : UIEntryView = UIEntryView()
    public var txtFirstName : UIEntryView = UIEntryView()
    public var txtLastName : UIEntryView = UIEntryView()
    public var txtAge : UIEntryView = UIEntryView()
    public var btnUpdate : UIButton = UIButton()
    
    //MARK: - Declaration of variables
    private var previousUid : String = ""
    
    //MARK: - Declaration of outlets
    @IBOutlet weak var lblTitleDebug: UILabel!
    
    
    //MARK: - View load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        lblTitleDebug.isHidden = true
        initialize()
        self.title = Strings_En.profileTitle

    }
    //MARK: - View initalization functions
    private func updateValues()
    {
        txtEmail.txtEntry.text = Contants.loggedUser.email
        txtFirstName.txtEntry.text = Contants.loggedUser.firstName
        txtLastName.txtEntry.text = Contants.loggedUser.lastName
        txtAge.txtEntry.text = Contants.loggedUser.age
        self.previousUid = Contants.loggedUser.uid!

    }
    private func setPlaceholders()
    {
        txtEmail.title = Strings_En.email
        txtFirstName.title = Strings_En.firstName
        txtLastName.title = Strings_En.lastName
        txtAge.title = Strings_En.age
        
        updateValues()

    }
    private func configure()
    {
        setPlaceholders()
        
        txtEmail.typeOfKeyboard = .emailAddress
        txtEmail.capitalizationType = .none

        txtAge.typeOfKeyboard = .numberPad
        
    }
    private func fixButton()
    {
        btnUpdate.setTitle(Strings_En.buttonUpdateTitle, for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnUpdate.backgroundColor = UIColor(named: Contants.frenchBlue)
        btnUpdate.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapUpdate = UITapGestureRecognizer(target: self, action: #selector(btnUpdateTouchUp))
        self.btnUpdate.addGestureRecognizer(tapUpdate)
        self.btnUpdate.isUserInteractionEnabled = true
    }
    
    //MARK: - Initialize function
    private func initialize()
    {
        self.view.addSubviews(txtEmail, txtFirstName, txtLastName, txtAge, btnUpdate, navbar)
        self.navbar.delegate = self
        configure()
        fixButton()
        applyContraints()
    }
    
    //MARK: - Applying contraints
    private func applyContraints()
    {
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        txtFirstName.translatesAutoresizingMaskIntoConstraints = false
        txtLastName.translatesAutoresizingMaskIntoConstraints = false
        txtAge.translatesAutoresizingMaskIntoConstraints = false
        btnUpdate.translatesAutoresizingMaskIntoConstraints = false
        navbar.translatesAutoresizingMaskIntoConstraints = false

        
        txtEmail.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtEmail.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtEmail.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        txtEmail.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtFirstName.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtFirstName.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtFirstName.topAnchor.constraint(equalTo: txtEmail.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtFirstName.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true

        txtLastName.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtLastName.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtLastName.topAnchor.constraint(equalTo: txtFirstName.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtLastName.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtAge.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtAge.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtAge.topAnchor.constraint(equalTo: txtLastName.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtAge.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        navbar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navbar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        navbar.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navbar.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        btnUpdate.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        btnUpdate.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        btnUpdate.bottomAnchor.constraint(equalTo: navbar.topAnchor, constant: -20).isActive = true
        btnUpdate.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    //MARK: - Navbar Action Handlers
    func conjugateTapped()
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let conjugateViewController = main.instantiateViewController(withIdentifier: Segue.ConjugateViewController)
        show(conjugateViewController, sender: self)

        print("Conjugate tapped")
    }
    func profileTapped()
    {
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let profileViewController = main.instantiateViewController(withIdentifier: Segue.ProfileViewController)
//        show(profileViewController, sender: self)
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
    
    //MARK: - Update action handler
    @objc func btnUpdateTouchUp()
    {
        //Validate Regex email
        guard let email = txtEmail.txtEntry.text, email != "", email.isValidEmail() == true else
        {
            btnUpdate.shakeWith(txtEmail)
            return
        }
        guard let firstName = txtFirstName.txtEntry.text, firstName != "" else
        {
            btnUpdate.shakeWith(txtFirstName)
            return
        }
        guard let lastName = txtLastName.txtEntry.text, lastName != "" else
        {
            btnUpdate.shakeWith(txtLastName)
            return
        }
        guard let age = txtAge.txtEntry.text, age != "" else
        {
            btnUpdate.shakeWith(txtAge)
            return
        }
        if (((age as NSString).integerValue) < 1) || (((age as NSString).integerValue) > 120)
        {
            btnUpdate.shakeWith(txtAge)
            return
        }

        var student = Student(firstName: firstName, lastName: lastName, email: email, age: age)
        Contants.loggedUser = student
        Contants.loggedUser.uid = self.previousUid
        Contants.loggedUser.save(successHandler: updateUserSuccessHandler, failHandler: updateUserFailSuccessHandler)

        print("Update tapped")
    }
    func updateUserSuccessHandler()
    {
        print("The student was updated")
        Toast.show(view: self, title: Strings_En.ToastUpdateProfileSuccessTitle , message: Strings_En.ToastUpdateProfileSuccessTitle)
        let main = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = main.instantiateViewController(withIdentifier: Segue.ProfileViewController)
        show(profileViewController, sender: self)
    }
    func updateUserFailSuccessHandler(_ errorMessage : String)
    {
        print("SaveFail -> \(errorMessage)")
        btnUpdate.shakeWith(txtEmail, txtAge, txtFirstName, txtLastName)
    }
    


}

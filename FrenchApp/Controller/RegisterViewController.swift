//
//  RegisterViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-05.
//

import UIKit
import FirebaseCoreInternal

class RegisterViewController: UIViewController {

    //MARK: - Declaration of Views
    public var txtEmail : UIEntryView = UIEntryView()
    public var txtPassword : UIEntryView = UIEntryView()
    public var txtFirstName : UIEntryView = UIEntryView()
    public var txtLastName : UIEntryView = UIEntryView()
    public var txtAge : UIEntryView = UIEntryView()
    public var timer : Timer = Timer()

    
    //MARK: - Declaration of variables
    public var studentToBeSaved : Student?

    //MARK: - Declaration of outlets
    @IBOutlet weak var btnRegisterOutlet: UIButton!
    
    //MARK: - View load
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        self.title = Strings_En.registerTitle
        
    }
    
    //MARK: - View initalization functions
    private func setPlaceholders()
    {
        txtEmail.title = Strings_En.email
        txtPassword.title = Strings_En.password
        txtFirstName.title = Strings_En.firstName
        txtLastName.title = Strings_En.lastName
        txtAge.title = Strings_En.age

    }
    private func configure()
    {
        setPlaceholders()
        
        txtEmail.typeOfKeyboard = .emailAddress
        txtEmail.capitalizationType = .none
        
        txtPassword.capitalizationType = .none

        txtAge.typeOfKeyboard = .numberPad
    }
    
    //MARK: - Initialize function
    private func initialize()
    {
        self.view.addSubviews(txtEmail, txtFirstName, txtLastName, txtAge, txtPassword)
        
        applyContraints()
        configure()

    }
    
    //MARK: - Applying constraints
    private func applyContraints()
    {
        
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        txtFirstName.translatesAutoresizingMaskIntoConstraints = false
        txtLastName.translatesAutoresizingMaskIntoConstraints = false
        txtAge.translatesAutoresizingMaskIntoConstraints = false
        txtPassword.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        txtPassword.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtPassword.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtPassword.topAnchor.constraint(equalTo: txtAge.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtPassword.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
    }
    
    //MARK: - Register action handler
    @IBAction func btnRegisterTouchUp(_ sender: Any)
    {
        //Validate Regex email
        guard let email = txtEmail.txtEntry.text, email != "", email.isValidEmail() == true else
        {
            btnRegisterOutlet.shakeWith(txtEmail)
            return
        }
        guard let firstName = txtFirstName.txtEntry.text, firstName != "" else
        {
            btnRegisterOutlet.shakeWith(txtFirstName)
            return
        }
        guard let lastName = txtLastName.txtEntry.text, lastName != "" else
        {
            btnRegisterOutlet.shakeWith(txtLastName)
            return
        }
        guard let age = txtAge.txtEntry.text, age != "" else
        {
            btnRegisterOutlet.shakeWith(txtAge)
            return
        }
        if (((age as NSString).integerValue) < 1) || (((age as NSString).integerValue) > 120)
        {
            btnRegisterOutlet.shakeWith(txtAge)
            return
        }
        guard let password = txtPassword.txtEntry.text, password.count >= 6 else
        {
            btnRegisterOutlet.shakeWith(txtPassword)
            return
        }

        var student = Student(firstName: firstName, lastName: lastName, email: email, age: age)
        Authentication.signUp(user: student, password: password, successHandler: authSuccessHandler, failHandler: authFailHandler)
    }
    
    //MARK: - Authentication action handler
    func authSuccessHandler(_ student : Student)
    {
        print("Auth was succesful")
        self.studentToBeSaved = student
        student.save(successHandler: saveUserSucessHandler, failHandler: saveUserFailHandler)
    }
    func authFailHandler(_ errorMessage : String)
    {
        print("AuthenticationFail -> \(errorMessage)")
        btnRegisterOutlet.shakeWith(txtEmail, txtPassword, txtAge, txtFirstName, txtLastName)
    }
    
    //MARK: - Save User action handlers
    func saveUserSucessHandler()
    {
        print("The new student was saved")
        var friendBook : FriendBook = FriendBook()
        friendBook.uid = self.studentToBeSaved?.uid
        friendBook.email = self.studentToBeSaved?.email
        friendBook.save(successHandler: saveFriendBookSuccessHandler, failHandler: saveFriendBookFailHandler)
 
    }
    func saveUserFailHandler(_ errorMessage : String)
    {
        print("SaveFail -> \(errorMessage)")
        btnRegisterOutlet.shakeWith(txtEmail, txtPassword, txtAge, txtFirstName, txtLastName)
    }
    
    //MARK: - Save FriendBook action handlers
    func saveFriendBookSuccessHandler()
    {
        print("The new friend book was created")
        Toast.show(view: self, title: Strings_En.ToastRegisterSuccessTitle, message: Strings_En.ToastRegisterSuccessMessage)
        goToNextScreen()
//        performSegue(withIdentifier: Segue.fromRegister_toLogin, sender: self)
//        self.navigationController?.popViewController(animated: true)
    }
    func saveFriendBookFailHandler(error : String)
    {
        print(error)
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
                let loginViewController = main.instantiateViewController(withIdentifier: Segue.LoginViewController)
                self.show(loginViewController, sender: self)
            }
      
        })
    }
    
}

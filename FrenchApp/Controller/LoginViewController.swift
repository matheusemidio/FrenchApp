//
//  LoginViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-05.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Declaration of views
    public var txtEmail : UIEntryView = UIEntryView()
    public var txtPassword : UIEntryView = UIEntryView()
    
    //MARK: - Declaration of variables

    
    //MARK: - Declaration of outlets
    @IBOutlet weak var btnLoginOutlet: UIButton!
    
    //MARK: - View load and initialization of entries
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    private func setPlaceholders()
    {
        txtEmail.title = Strings_En.email
        txtPassword.title = Strings_En.password

    }
    private func configure()
    {
        setPlaceholders()
        
        txtEmail.typeOfKeyboard = .emailAddress
        txtEmail.capitalizationType = .none
        txtPassword.capitalizationType = .none
        
        txtPassword.isSecure = true
//        txtPassword.typeOfKeyboard = .default
        
    }
    
    //MARK: - Initialize and constraints
    private func initialize()
    {
        configure()
    
        self.view.addSubviews(txtEmail, txtPassword)
        applyContraints()
        
        
        //Debug:
        txtEmail.txtEntry.text = "tony2@me.com"
        txtPassword.txtEntry.text = "123456"
    }
    
    private func applyContraints()
    {
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        
        txtEmail.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtEmail.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtEmail.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        txtEmail.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        txtPassword.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtPassword.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtPassword.topAnchor.constraint(equalTo: txtEmail.bottomAnchor, constant: Contants.formEntrySpacing).isActive = true
        txtPassword.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true

    }
    
    //MARK: - Login action handler
    @IBAction func btnLoginTouchUp(_ sender: Any)
    {
        guard let email = txtEmail.txtEntry.text, email != "", email.isValidEmail() == true else
        {
            btnLoginOutlet.shakeWith(txtEmail)
            return
        }
        guard let password = txtPassword.txtEntry.text, password != "", password.count >= 6 else
        {
            btnLoginOutlet.shakeWith(txtPassword)
            return
        }
        Authentication.signIn(email: email, password: password, successHandler: authSuccessHandler, failHandler: authFailHandler)
    }
    
    //MARK: - Authentication action handler
    func authSuccessHandler( _ userUid : String)
    {
        Student.find(uid: userUid, successHandler: findSuccessHandler, failHandler: findFailHandler)
    }
    func authFailHandler(_ errorMessage : String)
    {
        print("AuthenticationFail -> \(errorMessage)")
        btnLoginOutlet.shakeWith(txtEmail, txtPassword)
        Toast.show(view: self, title: "Fail", message: "Wrong email and password do not match.")

    }
    
    //MARK: - Find action handler
    func findSuccessHandler(_ student : Student)
    {
        print("Login was sucessful")
        Contants.loggedUser = student
        FriendBook.find(uid: student.uid!, successHandler: findFriendBookSuccessHandler, failHandler: findFriendBookFailHandler)
       
    }
    func findFailHandler(_ errorMessage : String)
    {
        print("FindFail -> \(errorMessage)")
    }
    func findFriendBookSuccessHandler(_ friendBook : FriendBook)
    {
        Contants.loggedFriendBook = friendBook
        let main = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = main.instantiateViewController(withIdentifier: Segue.HomeViewController)
        show(homeViewController, sender: self)
    }
    func findFriendBookFailHandler(_ errorMessage : String)
    {
        print(errorMessage)
    }
    
}

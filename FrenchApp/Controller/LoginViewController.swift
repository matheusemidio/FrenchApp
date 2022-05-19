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
    public var timer : Timer = Timer()

    //MARK: - Declaration of variables

    
    //MARK: - Declaration of outlets
    @IBOutlet weak var btnLoginOutlet: UIButton!
    
    //MARK: - View load
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        self.title = Strings_En.loginTitle
    }
    
    //MARK: - View initalization functions
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
    }
    
    //MARK: - Initialize Function
    private func initialize()
    {
        //Debug:
        txtEmail.txtEntry.text = Strings_En.hardcodedEmail
        txtPassword.txtEntry.text = Strings_En.hardcodedPassword
        
        self.view.addSubviews(txtEmail, txtPassword)
   
        configure()
        applyContraints()


    }
    
    //MARK: - Applying constraints
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
    
    //MARK: - Login action handlers
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
    
    //MARK: - Authentication action handlers
    func authSuccessHandler( _ userUid : String)
    {
        Student.find(uid: userUid, successHandler: findUserSuccessHandler, failHandler: findUserFailHandler)
    }
    func authFailHandler(_ errorMessage : String)
    {
        print("AuthenticationFail -> \(errorMessage)")
        btnLoginOutlet.shakeWith(txtEmail, txtPassword)
        Toast.show(view: self, title: Strings_En.ToastAuthenticationFailTitle, message: Strings_En.ToastAuthenticationFailMessage)

    }
    
    //MARK: - Find User action handler
    func findUserSuccessHandler(_ student : Student)
    {
        print("Login was sucessful")
        Contants.loggedUser = student
        FriendBook.find(uid: student.uid!, successHandler: findFriendBookSuccessHandler, failHandler: findFriendBookFailHandler)
       
    }
    func findUserFailHandler(_ errorMessage : String)
    {
        print("FindFail -> \(errorMessage)")
    }
    
    //MARK: - Find FriendBook action handler
    func findFriendBookSuccessHandler(_ friendBook : FriendBook)
    {
        for friend in friendBook.listOfFriends
        {
            if(friend.uid != nil)
            {
                Contants.loggedFriendBook.listOfFriends.append(friend)
            }
        }
        Toast.show(view: self, title: Strings_En.ToastLogInSuccessTitle, message: Strings_En.ToastLogInSuccessMessage)
        goToNextScreen()
        
    }
    
    func findFriendBookFailHandler(_ errorMessage : String)
    {
        print(errorMessage)
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
                let homeViewController = main.instantiateViewController(withIdentifier: Segue.HomeViewController)
                self.show(homeViewController, sender: self)
            }
      
        })
    }
    
}

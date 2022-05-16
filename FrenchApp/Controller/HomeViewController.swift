//
//  HomeViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-05.
//

import UIKit

class HomeViewController: UIViewController, UINavbarDelegate {

    //MARK: - Declaration of views
    public var navbar : UINavbar = UINavbar()
    public var test : TestCell = TestCell()
    
    //MARK: - Declaration of variables

    //MARK: - Declaration of outlets
    @IBOutlet weak var titleDebugOutlet: UILabel!

    //MARK: - View load and initialization of entries
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        self.title = Strings_En.homeTitle
        titleDebugOutlet.isHidden = true

    }
    public func fixTest()
    {
        test.name = "Matheus"
        test.number = 10
    }
    //MARK: - Initialize and constraints
    private func initialize()
    {
        self.view.addSubviews(navbar, test)
        self.navbar.delegate = self
        applyContraints()
        fixTest()
    }
    
    private func applyContraints()
    {
        test.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        test.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        test.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        test.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true
        
        navbar.translatesAutoresizingMaskIntoConstraints = false
        navbar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navbar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        navbar.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navbar.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
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
        let main = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = main.instantiateViewController(withIdentifier: Segue.ProfileViewController)
        show(profileViewController, sender: self)
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
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let homeViewController = main.instantiateViewController(withIdentifier: Segue.HomeViewController)
//        show(homeViewController, sender: self)
        print("Home tapped")
    }


}

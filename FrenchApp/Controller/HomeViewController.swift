

import UIKit

class HomeViewController: UIViewController, UINavbarDelegate {

    //MARK: - Declaration of views
    public var navbar : UINavbar = UINavbar()
//    public var test : TestCell = TestCell()
    
    //MARK: - Declaration of variables

    //MARK: - Declaration of outlets
    @IBOutlet weak var titleDebugOutlet: UILabel!

    //MARK: - View load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        self.title = Strings_En.homeTitle
        titleDebugOutlet.isHidden = true

    }

    //MARK: - Initialize function
    private func initialize()
    {
        self.view.addSubviews(navbar)
        self.navbar.delegate = self
        applyContraints()
    }
    
    //MARK: - Applying constraints
    private func applyContraints()
    {
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

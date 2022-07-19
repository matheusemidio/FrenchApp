
import UIKit

private let identifier : String = "UIFriendCell"

class SocialViewController: UIViewController, UINavbarDelegate, UITableViewDelegate, UITableViewDataSource
{
    //MARK: - Declaration of views
    public var navbar : UINavbar = UINavbar()
    public var txtSearch : UIEntryView = UIEntryView()
    public var btnSearch : UIButton = UIButton()
    public var btnAdd : UIButton = UIButton()

    //    public var friendCell : UIFriendCell = UIFriendCell
    
    //MARK: - Declaration of variables
    var friendBook : FriendBook?
    var searchedEmail : String?
    var searchedStudent : Student?
    var testBook : FriendBook?
//    var listOfAllStudentsSupport : [Student]?
    
    //MARK: - Declaration of outlets
    @IBOutlet weak var tableView : UITableView!
    
    //MARK: - View load
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        self.title = Strings_En.socialTitle
        
        
//        FriendBook.find(uid: Contants.loggedUser.uid!, successHandler: { friendBook in
//            self.testBook = friendBook
//            DispatchQueue.main.async
//            {
//                self.tableView.reloadData()
//            }
//
//        }, failHandler: { errorMessage in
//            print(errorMessage)
//        })
  
    
    }
    //MARK: - View initalization functions
    private func fixTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
    
        self.tableView.register(UIFriendCell.self, forCellReuseIdentifier: identifier)
    
    //        tvTransactionsOutlet.enableTapGestureRecognizer(target: self, action: #selector(tableViewTapped(tapGestureRecognizer:)))
    //
    //        refreshControl.addTarget(self, action: #selector(tableRefreshControl), for: UIControl.Event.valueChanged)
    //        tvTransactionsOutlet.addSubview(refreshControl)
    }
    private func fixButton()
    {
        btnSearch.setTitle(Strings_En.buttonSearchTitle, for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnSearch.backgroundColor = UIColor(named: Contants.frenchBlue)
        btnSearch.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapSearch = UITapGestureRecognizer(target: self, action: #selector(btnSearchTouchUp))
        self.btnSearch.addGestureRecognizer(tapSearch)
        self.btnSearch.isUserInteractionEnabled = true
        
        btnAdd.setTitle(Strings_En.buttonAddFriendTitle, for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnAdd.backgroundColor = UIColor(named: Contants.frenchRed)
        btnAdd.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapAdd = UITapGestureRecognizer(target: self, action: #selector(btnAddTouchUp))
        self.btnAdd.addGestureRecognizer(tapAdd)
        self.btnAdd.isUserInteractionEnabled = true
        self.btnAdd.isHidden = true
    }
    private func fixEntry()
    {
        txtSearch.title = Strings_En.searchFriend
        txtSearch.capitalizationType = .none
//        txtSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    //MARK: - Initialize Function
    private func initialize()
    {
        self.view.addSubviews(navbar, txtSearch, btnSearch, btnAdd)
        self.navbar.delegate = self
        applyContraints()
    //        fixCell()
        fixTableView()
        refreshListOfFriends()
        fixButton()
        fixEntry()
        updateListOfFriendsVersion()

        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Contants.loggedFriendBook.listOfFriends.count - 1)
//        return self.testBook!.listOfFriends.count
//        return self.friendBook.listOfFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! UIFriendCell
        cell.friendModel = Contants.loggedFriendBook.listOfFriends[(indexPath.row + 1)]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Contants.heightTableViewCell
    }
    
    //MARK: - Friend Book init
    private func refreshListOfFriends()
    {
        FriendBook.find(uid: Contants.loggedUser.uid!, successHandler: findFriendBookSuccessHandler, failHandler: findFriendBookFailHandler)
        
//        var student = Student(firstName: "Matheus", lastName: "Cadena", email: "matheus@me.com", age: "25")
//        listOfFriends.append(student)
    }
    
    //MARK: - Find FriendBook action handlers
    func findFriendBookSuccessHandler(_ friendBook : FriendBook)
    {
//        for friend in friendBook.listOfFriends
//        {
//            if(friend.uid != nil)
//            {
////                Contants.loggedFriendBook.listOfFriends.append(friend)
//                self.friendBook?.listOfFriends.append(friend)
//            }
//        }
        self.friendBook = friendBook
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
        
    }
    func findFriendBookFailHandler(error : String)
    {
        print(error)
    }
    
    //MARK: - Search action handlers
    @objc func btnSearchTouchUp()
    {
        guard let txtSearchedEmail = txtSearch.txtEntry.text, txtSearchedEmail != "", txtSearchedEmail.isValidEmail() == true else
        {
            btnSearch.shakeWith(txtSearch)
            return
        }
        self.searchedEmail = txtSearchedEmail
        Student.findAll(successHandler: findAllStudentsSuccessHandler, failHandler: findAllStudentsFailHandler)
    }
    
    //MARK: - Find All Students action handlers
    func findAllStudentsSuccessHandler(listOfStudents : [Student])
    {
        //For debug
//        btnAdd.isHidden = false
        var studentExists = false
        var friendAlreadyAdded = false

        for student in listOfStudents {
            //The student searched exist
            if(student.email.lowercased() == self.searchedEmail?.lowercased())
            {
                studentExists = true
                //Check if the student searched is already on the FriendBook
                for aStudent in Contants.loggedFriendBook.listOfFriends
                {
                    if(self.searchedEmail?.lowercased() == aStudent.email.lowercased())
                    {
                        friendAlreadyAdded = true
                    }
                }
                if(friendAlreadyAdded == false)
                {
                    self.searchedStudent = student
                    print(searchedEmail)
                    btnAdd.isHidden = false
                }
                //Update table view with the students found
            }
        }
        if(studentExists == false)
        {
            btnSearch.shake()
        }
        if(friendAlreadyAdded == true)
        {
            Toast.show(view: self, title: Strings_En.ToastAlreadyExistTitle, message: Strings_En.ToastAlreadyExistMessage)

        }

    }
    func findAllStudentsFailHandler(error : String)
    {
        print(error)
    }
    
    //MARK: - Add action handlers
    @objc func btnAddTouchUp()
    {
        print("Button add tapped")
        Contants.loggedFriendBook.listOfFriends.append(self.searchedStudent!)
//        Contants.loggedUser.save(successHandler: updateUserSuccessHandler, failHandler: updateUserFailSuccessHandler)
        Contants.loggedFriendBook.uid = Contants.loggedUser.uid
        Contants.loggedFriendBook.save(successHandler: saveFriendBookSuccessHandler, failHandler: saveFriendBookFailHandler)
        //Update table view to show the list of friends and hide the button add
    }
    func saveFriendBookSuccessHandler()
    {
        print("The student book was updated")
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
        Toast.show(view: self, title: Strings_En.ToastAddedFriendSuccessTitle, message: Strings_En.ToastAddedFriendSuccessMessage )
      
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let socialViewController = main.instantiateViewController(withIdentifier: Segue.SocialViewController)
//        show(socialViewController, sender: self)
    }
    func saveFriendBookFailHandler(_ errorMessage : String)
    {
        print("SaveFail -> \(errorMessage)")
        btnAdd.shakeWith(txtSearch, btnSearch)
    }
    //MARK: - Friend Book init
    private func updateListOfFriendsVersion()
    {
        for (index, element) in Contants.loggedFriendBook.listOfFriends.enumerated() {
            for student in Contants.listOfAllStudentsSupport!
            {
                if(student.email == element.email)
                {
                    Contants.loggedFriendBook.listOfFriends[index] = student
                }
            }
        }
    }
    
    //MARK: - Applying contraints
    private func applyContraints()
    {
  
        txtSearch.translatesAutoresizingMaskIntoConstraints = false
        txtSearch.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtSearch.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtSearch.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        txtSearch.heightAnchor.constraint(equalToConstant: Contants.formEntryHeight).isActive = true

        btnSearch.translatesAutoresizingMaskIntoConstraints = false
        btnSearch.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        btnSearch.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        btnSearch.topAnchor.constraint(equalTo: txtSearch.bottomAnchor, constant: 20).isActive = true
        btnSearch.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: btnSearch.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: btnAdd.topAnchor).isActive = true
        
        btnAdd.translatesAutoresizingMaskIntoConstraints = false
        btnAdd.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        btnAdd.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        btnAdd.bottomAnchor.constraint(equalTo: navbar.topAnchor, constant: -10).isActive = true
        btnAdd.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
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
    //        let main = UIStoryboard(name: "Main", bundle: nil)
    //        let socialViewController = main.instantiateViewController(withIdentifier: Segue.SocialViewController)
    //        show(socialViewController, sender: self)
        print("Social tapped")
    }
    func homeTapped()
    {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = main.instantiateViewController(withIdentifier: Segue.HomeViewController)
        show(homeViewController, sender: self)
        print("Home tapped")
    }
    
}

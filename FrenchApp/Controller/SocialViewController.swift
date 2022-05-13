//
//  SocialViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-10.
//

import UIKit
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
    
    
    //MARK: - Declaration of outlets
    @IBOutlet weak var tableView : UITableView!
    
    //MARK: - View load and initialization of entries
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        self.title = Strings_En.socialTitle
    
    }
    //MARK: - Initialize and constraints
    private func fixTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
    
        self.tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    
    //        tvTransactionsOutlet.enableTapGestureRecognizer(target: self, action: #selector(tableViewTapped(tapGestureRecognizer:)))
    //
    //        refreshControl.addTarget(self, action: #selector(tableRefreshControl), for: UIControl.Event.valueChanged)
    //        tvTransactionsOutlet.addSubview(refreshControl)

    }
    private func fixButton()
    {
        btnSearch.setTitle("Search", for: .normal)
//        btnUpdate.tintColor = UIColor(named: Contants.frenchBlue)
        btnSearch.backgroundColor = UIColor(named: Contants.frenchBlue)
        btnSearch.titleLabel?.font =  UIFont(name: "...", size: 30)
        
        let tapSearch = UITapGestureRecognizer(target: self, action: #selector(btnSearchTouchUp))
        self.btnSearch.addGestureRecognizer(tapSearch)
        self.btnSearch.isUserInteractionEnabled = true
        
        btnAdd.setTitle("Add Friend", for: .normal)
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

    }
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
    
        
    //        friendCell.translatesAutoresizingMaskIntoConstraints = false
    //        friendCell.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
    //        friendCell.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
    //        friendCell.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
    //        friendCell.heightAnchor.constraint(equalToConstant: Contants.heightTableViewCell).isActive = true
    //
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
    //MARK: - Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contants.loggedFriendBook.listOfFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as! FriendTableViewCell
//        cell.setCellContent(student: listOfFriends[0], number: 10)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Contants.heightTableViewCell
    }
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        self.view.endEditing(true)
    //    }
    //    @objc func tableViewTapped(tapGestureRecognizer: UITapGestureRecognizer)
    //    {
    //        self.view.endEditing(true)
    //    }
    
    //MARK: - Friend Book init
    private func refreshListOfFriends()
    {
        FriendBook.find(uid: Contants.loggedUser.uid!, successHandler: findFriendBookSuccessHandler, failHandler: findFriendBookFailHandler)
        
//        var student = Student(firstName: "Matheus", lastName: "Cadena", email: "matheus@me.com", age: "25")
//        listOfFriends.append(student)
    }
    func findFriendBookSuccessHandler(_ friendBook : FriendBook)
    {
        self.friendBook = friendBook
    }
    func findFriendBookFailHandler(error : String)
    {
        print(error)
    }
    
    //MARK: - Update action handler
    @objc func btnSearchTouchUp()
    {
        guard let txtSearchedEmail = txtSearch.txtEntry.text, txtSearchedEmail != "", txtSearchedEmail.isValidEmail() == true else
        {
            btnSearch.shakeWith(txtSearch)
            return
        }
        self.searchedEmail = txtSearchedEmail
        Student.findAll(successHandler: findAllSuccessHandler, failHandler: findAllFailHandler)
    }
    //MARK: - Find All action handlers
    func findAllSuccessHandler(listOfStudents : [Student])
    {
        //For debug
//        btnAdd.isHidden = false
        
        for student in listOfStudents {
            //The student searched exist
            if(student.email.lowercased() == self.searchedEmail?.lowercased())
            {
                //Check if the student searched is already on the FriendBook
                var friendAlreadyAdded = false
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
        
    }
    func findAllFailHandler(error : String)
    {
        print(error)
    }
    
    //MARK: - Add action handler
    @objc func btnAddTouchUp()
    {
        print("Button add tapped")
        Contants.loggedFriendBook.listOfFriends.append(self.searchedStudent!)
//        Contants.loggedUser.save(successHandler: updateUserSuccessHandler, failHandler: updateUserFailSuccessHandler)
        Contants.loggedFriendBook.save(successHandler: saveFriendSuccessHandler, failHandler: saveFriendBookFailHandler)
        //Update table view to show the list of friends and hide the button add
    }
    func saveFriendSuccessHandler()
    {
        print("The student book was updated")
        Toast.show(view: self, title: "Success", message: "New friend added to the list.")
        let main = UIStoryboard(name: "Main", bundle: nil)
        let socialViewController = main.instantiateViewController(withIdentifier: Segue.SocialViewController)
        show(socialViewController, sender: self)
    }
    func saveFriendBookFailHandler(_ errorMessage : String)
    {
        print("SaveFail -> \(errorMessage)")
        btnAdd.shakeWith(txtSearch, btnSearch)
    }
    
//    //MARK: - Text change event
//    @objc func textFieldDidChange(_ textField: UITextField) {
//
//    }
}


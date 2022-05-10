//
//  HomeViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-05.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Declarations
    public var navbar : UINavbar = UINavbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
    }
    private func initialize()
    {
        self.view.addSubview(navbar)
        applyContraints()
    }
    private func applyContraints()
    {
        navbar.translatesAutoresizingMaskIntoConstraints = false
        navbar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navbar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        navbar.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navbar.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
    }
    


}

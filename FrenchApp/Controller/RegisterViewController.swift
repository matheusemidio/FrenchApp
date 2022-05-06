//
//  RegisterViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-05.
//

import UIKit

class RegisterViewController: UIViewController {

    public var txtEmail : UiEntryView = UiEntryView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
    }
    
    private func initialize()
    {
        txtEmail.title = "Email"
        self.view.addSubviews(txtEmail)
        applyContraints()
    }
    private func applyContraints()
    {
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        
        txtEmail.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        txtEmail.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        txtEmail.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        txtEmail.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @IBAction func test(_ sender: Any) {
//        print(self.txtEmail)
    }
}

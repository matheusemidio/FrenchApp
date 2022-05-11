//
//  UINavbar.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-10.
//

import UIKit

//MARK: - Delegate handler
protocol UINavbarDelegate {
    
    func conjugateTapped()
    func socialTapped()
    func profileTapped()
    func homeTapped()
    
}

extension UINavbarDelegate {
    
    func conjugateTapped() {
        // no code
    }
    func socialTapped() {
        // no code
    }
    func profileTapped() {
        // no code
    }
    func homeTapped() {
        // no code
    }
    
}

class UINavbar: UIView{

    //MARK: - Declaration of items
    public var delegate : UINavbarDelegate?
    
    public var navItemHome : UINavbarItem = UINavbarItem()
    public var navItemProfile : UINavbarItem = UINavbarItem()
    public var navItemConjugate : UINavbarItem = UINavbarItem()
    public var navItemSocial : UINavbarItem = UINavbarItem()
    
    //MARK: - Setters
    private func configure()
    {
        navItemProfile.image = "person.fill"
        navItemProfile.text = "Profile"
        navItemProfile.layer.borderWidth = 1
        navItemProfile.layer.borderColor = UIColor.black.cgColor
        
        navItemSocial.image = "person.3.sequence.fill"
        navItemSocial.text = "Social"
        navItemSocial.layer.borderWidth = 1
        navItemSocial.layer.borderColor = UIColor.black.cgColor
        
        navItemConjugate.image = "books.vertical.fill"
        navItemConjugate.text = "Conjugate"
        navItemConjugate.layer.borderWidth = 1
        navItemConjugate.layer.borderColor = UIColor.black.cgColor
        
        navItemHome.image = "house.fill"
        navItemHome.text = "Home"
        navItemHome.layer.borderWidth = 1
        navItemHome.layer.borderColor = UIColor.black.cgColor
    }
    //MARK: - Required functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Initializers
    private func initialize()
    {
        configure()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(navItemProfile, navItemSocial, navItemConjugate, navItemHome)
       
        self.backgroundColor = UIColor(named: Contants.frenchBlue)?.withAlphaComponent(0.10)
//        self.backgroundColor = .lightGray.withAlphaComponent(0.70)

        handleGestureRecognizer()
        
        applyContraints()
        
    }

    private func applyContraints()
    {
        navItemProfile.translatesAutoresizingMaskIntoConstraints = false
        navItemSocial.translatesAutoresizingMaskIntoConstraints = false
        navItemConjugate.translatesAutoresizingMaskIntoConstraints = false
        navItemHome.translatesAutoresizingMaskIntoConstraints = false
        
        navItemHome.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navItemHome.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        navItemHome.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navItemHome.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        navItemHome.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25).isActive = true
        
        navItemConjugate.leadingAnchor.constraint(equalTo: navItemHome.trailingAnchor).isActive = true
        navItemConjugate.bottomAnchor.constraint(equalTo: navItemHome.bottomAnchor).isActive = true
        navItemConjugate.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navItemConjugate.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        navItemConjugate.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25).isActive = true
        
        navItemSocial.leadingAnchor.constraint(equalTo: navItemConjugate.trailingAnchor).isActive = true
        navItemSocial.bottomAnchor.constraint(equalTo: navItemHome.bottomAnchor).isActive = true
        navItemSocial.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        navItemSocial.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navItemSocial.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25).isActive = true
        
        navItemProfile.leadingAnchor.constraint(equalTo: navItemSocial.trailingAnchor).isActive = true
        navItemProfile.bottomAnchor.constraint(equalTo: navItemHome.bottomAnchor).isActive = true
        navItemProfile.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        navItemProfile.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navItemProfile.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25).isActive = true
        
    }
    
    //MARK: - Action Handlers
    private func handleGestureRecognizer()
    {
        //Adding gesture recognizer
        let tapConjugate = UITapGestureRecognizer(target: self, action: #selector(navbarItemConjugateTapped))
        let tapSocial = UITapGestureRecognizer(target: self, action: #selector(navbarItemSocialTapped))
        let tapProfile = UITapGestureRecognizer(target: self, action: #selector(navbarItemProfileTapped))
        let tapHome = UITapGestureRecognizer(target: self, action: #selector(navbarItemHomeTapped))

        self.navItemConjugate.addGestureRecognizer(tapConjugate)
        self.navItemSocial.addGestureRecognizer(tapSocial)
        self.navItemProfile.addGestureRecognizer(tapProfile)
        self.navItemHome.addGestureRecognizer(tapHome)
        
        self.navItemConjugate.isUserInteractionEnabled = true
        self.navItemSocial.isUserInteractionEnabled = true
        self.navItemProfile.isUserInteractionEnabled = true
        self.navItemHome.isUserInteractionEnabled = true
    }
    @objc private func navbarItemConjugateTapped() {
        
        // PENDING: call the protocol
        if delegate != nil {
            delegate?.conjugateTapped()
        }
        
    }
    @objc private func navbarItemSocialTapped() {
        
        // PENDING: call the protocol
        if delegate != nil {
            delegate?.socialTapped()
        }
        
    }
    @objc private func navbarItemProfileTapped() {
        
        // PENDING: call the protocol
        if delegate != nil {
            delegate?.profileTapped()
        }
        
    }
    @objc private func navbarItemHomeTapped() {
        
        // PENDING: call the protocol
        if delegate != nil {
            delegate?.homeTapped()
        }
        
    }
    
    
}

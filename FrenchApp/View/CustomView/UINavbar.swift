//
//  UINavbar.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-10.
//

import UIKit

class UINavbar: UIView {

    public var navItemProfile : UINavbarItem = UINavbarItem()
    public var navItemConjugate : UINavbarItem = UINavbarItem()
    public var navItemSocial : UINavbarItem = UINavbarItem()

    //MARK: - Declaration of items
//    private let navbar : UILabel =
//    {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 15)
//        label.textColor = .gray
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
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
        self.addSubviews(navItemProfile, navItemSocial, navItemConjugate)

        self.backgroundColor = .lightGray.withAlphaComponent(0.70)

        applyContraints()
        
    }
    private func applyContraints()
    {
        navItemProfile.translatesAutoresizingMaskIntoConstraints = false
        navItemSocial.translatesAutoresizingMaskIntoConstraints = false
        navItemConjugate.translatesAutoresizingMaskIntoConstraints = false
        
        navItemConjugate.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navItemConjugate.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        navItemConjugate.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navItemConjugate.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        navItemConjugate.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.332).isActive = true
        
        
        navItemSocial.leadingAnchor.constraint(equalTo: navItemConjugate.trailingAnchor).isActive = true
        navItemSocial.bottomAnchor.constraint(equalTo: navItemConjugate.bottomAnchor).isActive = true
        navItemSocial.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        navItemSocial.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navItemSocial.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.332).isActive = true
        
        navItemProfile.leadingAnchor.constraint(equalTo: navItemSocial.trailingAnchor).isActive = true
        navItemProfile.bottomAnchor.constraint(equalTo: navItemSocial.bottomAnchor).isActive = true
        navItemProfile.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        navItemProfile.heightAnchor.constraint(equalToConstant: Contants.navBarItemDimension).isActive = true
        navItemProfile.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.332).isActive = true
        

    }

    
    
    
}

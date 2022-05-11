//
//  UINavbarItem.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-10.
//

import UIKit

class UINavbarItem: UIView {

    //MARK: - Declaration of items
    private let lblItem : UILabel =
    {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imgItem : UIImageView =
    {
        let img = UIImageView()
        img.tintColor = .black
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //MARK: - Setters
    public var text : String = ""
    {
        didSet{
            self.lblItem.text = text
        }
    }
    public var image : String = ""
    {
        didSet{
            self.imgItem.image = UIImage(systemName: image)
        }
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(lblItem, imgItem)
        
        self.backgroundColor = UIColor(named: Contants.frenchBlue)?.withAlphaComponent(0.10)
//        self.backgroundColor = .lightGray.withAlphaComponent(0.70)
        
        applyContraints()
        
    }
    
    private func applyContraints()
    {
        imgItem.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imgItem.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imgItem.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        imgItem.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imgItem.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imgItem.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        lblItem.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        lblItem.topAnchor.constraint(equalTo: imgItem.bottomAnchor, constant: 5).isActive = true
        lblItem.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

}

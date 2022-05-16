//
//  UiEntryView.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-06.
//

import UIKit

class UIEntryView: UIView {

    //MARK: - Declaration of items
    private let imgBackground : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "textfield")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    public let txtEntry : UITextField = {
        let input = UITextField()
        input.font = UIFont.systemFont(ofSize: 20)
        input.textColor = .systemGray
        input.textAlignment = .center
        input.backgroundColor = .white
//        input.borderStyle = .roundedRect
        input.translatesAutoresizingMaskIntoConstraints = false
        input.isSecureTextEntry = false
        input.text = ""
        input.keyboardType = .default
//        input.autocapitalizationType = UITextAutocapitalizationType
        return input
        
    }()

    //MARK: - Setters
    public var title : String = "" {
        didSet{
            txtEntry.placeholder = title
        }
    }
    public var isSecure : Bool = false{
        didSet{
            txtEntry.isSecureTextEntry = isSecure
        }
    }
    public var enableInteraction : Bool = true{
        didSet{
//            txtEntry.isUserInteractionEnabled = enableInteraction
            txtEntry.isEnabled = enableInteraction
        }
    }
    public var capitalizationType : UITextAutocapitalizationType = .words
    {
        didSet{
            txtEntry.autocapitalizationType = capitalizationType
        }
    }
    public var typeOfKeyboard : UIKeyboardType = .asciiCapable{
        didSet{
            txtEntry.keyboardType = typeOfKeyboard
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
        self.addSubviews(txtEntry, imgBackground)
        self.bringSubviewToFront(txtEntry)

        applyContraints()
        
    }
    private func applyContraints()
    {

        imgBackground.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        imgBackground.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        imgBackground.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imgBackground.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true

        txtEntry.leadingAnchor.constraint(equalTo: imgBackground.leadingAnchor,constant: 50).isActive = true
        txtEntry.trailingAnchor.constraint(equalTo: imgBackground.trailingAnchor,constant: -50).isActive = true
        txtEntry.topAnchor.constraint(equalTo: imgBackground.topAnchor,constant: 20).isActive = true
        txtEntry.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
}

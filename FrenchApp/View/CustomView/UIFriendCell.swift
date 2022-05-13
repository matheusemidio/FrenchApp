//
//  UIFriendCellViewController.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-12.
//

import UIKit

class UIFriendCell : UIView {

    //MARK: - Declaration of items
    private let lblName : UILabel =
    {
        let label = UILabel()
        label.font.withSize(20)
        label.textAlignment = .left
        label.text = ""
        
        return label
    }()
    
    private let imgStreak : UILabel =
    {
        let img = UILabel()
        img.text = "🔥"
        img.textAlignment = .right
        img.isHidden = true
        return img
    }()
    
    private let lblStreakNumber : UILabel =
    {
        let number = UILabel()
        number.text = ""
        number.textAlignment = .right
        number.isHidden = true
        return number
    }()
    
    //MARK: - Setters
    public var name : String = ""
    {
        didSet{
            lblName.text = name
        }
    }
    public var number : Int = 0
    {
        didSet{
            if(number > 0)
            {
                lblStreakNumber.text = String(number)
                lblStreakNumber.isHidden = false
                imgStreak.isHidden = false
            }
            else
            {
                lblStreakNumber.isHidden = true
                imgStreak.isHidden = true
            }

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
        self.addSubviews(lblName, imgStreak, lblStreakNumber)

        self.backgroundColor = .white.withAlphaComponent(0.50)
        applyContraints()
        
    }
    private func applyContraints()
    {
        lblName.translatesAutoresizingMaskIntoConstraints = false
        imgStreak.translatesAutoresizingMaskIntoConstraints = false
        lblStreakNumber.translatesAutoresizingMaskIntoConstraints = false
        
        lblName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        lblName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        lblName.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        lblName.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true

        lblStreakNumber.leadingAnchor.constraint(equalTo: lblName.trailingAnchor).isActive = true
        lblStreakNumber.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2).isActive = true
        lblStreakNumber.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        lblStreakNumber.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        imgStreak.leadingAnchor.constraint(equalTo: lblStreakNumber.trailingAnchor).isActive = true
        imgStreak.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imgStreak.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        imgStreak.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        
    }
}

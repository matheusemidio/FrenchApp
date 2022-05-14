//
//  FriendTableViewCell.swift
//  FrenchApp
//
//  Created by Matheus Cadena on 2022-05-13.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    //MARK: - Declaration of outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblStreak: UILabel!
    static let identifier = "FriendTableViewCellID"
    
//    public var friendCell : UIFriendCell = UIFriendCell()
//        private func fixCell()
//        {
//            self.friendCell.number = 10
//        }
//    private func applyContraints()
//    {
//        friendCell.translatesAutoresizingMaskIntoConstraints = false
//        friendCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
//        friendCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
//        friendCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
//        friendCell.heightAnchor.constraint(equalToConstant: Contants.heightTableViewCell).isActive = true
//    }
//    func setCellContent(student : Student, number : Int)
    func setCellContent()
    {
//        self.friendCell.name = name
//        self.friendCell.number = number
//        fixCell()
//        applyContraints()
        var nb = 10
        var name = "Matheus"
        if(nb > 0)
        {
//            lblNumber.text = String(number)
            self.lblNumber.text = "10"
            self.lblNumber.isHidden = false
            self.lblStreak.isHidden = false
        }
        else
        {
            self.lblNumber.isHidden = true
            self.lblStreak.isHidden = true
        }
//        lblName.text = student.getFullName()
        self.lblName.text = name

    }
    
    //MARK: - Table view cell
    static func nib() -> UINib
    {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 

}

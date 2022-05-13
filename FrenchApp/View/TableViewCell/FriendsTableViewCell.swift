////
////  FriendTableViewCell.swift
////  FrenchApp
////
////  Created by Matheus Cadena on 2022-05-13.
////
//
//import UIKit
//
//class FriendTableViewCell: UITableViewCell {
//
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
//    func setCellContent(name : String, number : Int)
//    {
//        self.friendCell.name = name
//        self.friendCell.number = number
//        fixCell()
//        applyContraints()
//    }
//
//    //MARK: - Table view cell
//    static let identifier = "FriendTableViewCell"
//    static func nib() -> UINib
//    {
//        return UINib(nibName: identifier, bundle: nil)
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}

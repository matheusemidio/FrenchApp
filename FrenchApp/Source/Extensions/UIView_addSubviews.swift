

import Foundation
import UIKit


extension UIView {
    

    func addSubviews( _ subviews : UIView... ) {
    
        for subView in subviews {
            self.addSubview(subView)
        }
        
    }
    
    
}

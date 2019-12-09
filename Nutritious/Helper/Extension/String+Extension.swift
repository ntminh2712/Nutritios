
import Foundation
import UIKit

extension String {
    
}
extension Float {
    func convertTypePrice() -> String{
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.numberStyle = .decimal
        return "\(formatter.string(from: NSNumber(value: self))!)₫"
        
    }
}

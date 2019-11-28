
import Foundation
import UIKit

extension String {
    
}
extension Float {
    func convertTypePrice() -> Float{
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        return formatter.number(from: String(self)) as! Float
        
    }
}

//
//  MicronutrientsCollectionViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class MicronutrientsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbWeight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(indexPath:Int, weight:Float){
        switch indexPath {
        case 0:
            lbName.text = "Calories"
            lbWeight.text = String(weight)
        case 1:
            lbName.text = "Protein"
            lbWeight.text = "\(weight)g"
        case 2:
            lbName.text = "Lipit"
            lbWeight.text = "\(weight)g"
        case 3:
            lbName.text = "Canxi"
            lbWeight.text = "\(weight)mg"
        case 4:
            lbName.text = "Xenluloza"
            lbWeight.text = "\(weight)g"
        case 5:
            lbName.text = "Iron"
            lbWeight.text = "\(weight)mg"
        case 6:
            lbName.text = "Carbonhydrates"
            lbWeight.text = "\(weight)g"
        case 7:
            lbName.text = "Zinc"
            lbWeight.text = "\(weight)mg"
        case 8:
            lbName.text = "Vitamin A"
            lbWeight.text = "\(weight)µm"
        case 9:
            lbName.text = "Vitamin B"
            lbWeight.text = "\(weight)µm"
        case 10:
            lbName.text = "Vitamin C"
            lbWeight.text = "\(weight)µm"
        case 11:
            lbName.text = "Vitamin D"
            lbWeight.text = "\(weight)µm"
        case 12:
            lbName.text = "Vitamin E"
            lbWeight.text = "\(weight)µm"
        default:
            break
        }
    }

}

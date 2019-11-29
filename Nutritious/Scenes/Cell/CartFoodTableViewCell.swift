//
//  CartFoodTableViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class CartFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbWeight: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgFood: CardImage!
    @IBOutlet weak var lbQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data:FoodDetailEntity) {
        imgFood.setCustomImage(data.image, defaultAvatar: "")
        lbName.text = data.name
        lbPrice.text = String((data.price * Float(data.quantity)).convertTypePrice())
        lbWeight.text = "\(data.weight * Float(data.quantity))g"
        lbQuantity.text = String(data.quantity)
    }
    @IBAction func presentFoodDetail(_ sender: Any) {
        self.clickFood?()
    }
    @IBAction func popupBalon(_ sender: Any) {
        self.popupBalon?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var popupBalon:(()->())?
    var clickFood:(()->())?
    
}

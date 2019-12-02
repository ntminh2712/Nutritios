//
//  CartFoodTableViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
import KUIPopOver
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
    
    func setData(data:SetDetailEntity) {
        imgFood.setCustomImage(data.image, defaultAvatar: "")
        lbName.text = data.name
        lbPrice.text = String((data.price * Float(data.quantity)).convertTypePrice())
        lbWeight.text = "\(data.weight * Float(data.quantity))g"
        lbQuantity.text = String(data.quantity)
    }
    
    @IBAction func presentFoodDetail(_ sender: Any) {
        self.clickDetail?()
    }
    @IBAction func showPopupBalon(_ sender: UIButton) {
        self.popupBalon?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var popupBalon:(()->())?
    var clickDetail:(()->())?
    
}


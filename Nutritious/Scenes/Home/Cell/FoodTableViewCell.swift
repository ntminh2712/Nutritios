//
//  FoodTableViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbKcal: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data:FoodDetailEntity){
        imgFood.setCustomImage(data.image, defaultAvatar: "")
        lbName.text = data.name
        lbPrice.text = String(data.price.convertTypePrice())
        lbKcal.text = "\(data.calorie)kcal/\(data.weight)g"
        lbDescription.text = data._description
    }
    
    func setData(data:SetDetailEntity){
        imgFood.setCustomImage(data.image, defaultAvatar: "")
        lbName.text = data.name
        lbPrice.text = String(data.price.convertTypePrice())
        lbKcal.text = "\(data.calorie)kcal/\(data.weight)g"
        lbDescription.text = data._description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickFood(_ sender: Any) {
        self.clickFood?()
    }
    @IBAction func addToCart(_ sender: Any) {
        self.addToCart?()
        
    }
    
    var clickFood:(()->())?
    var addToCart:(()->())?
}

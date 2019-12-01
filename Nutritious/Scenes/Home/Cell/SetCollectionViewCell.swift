//
//  SetCollectionViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class SetCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgSet: UIImageView!
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var lbKcalPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView(){
        self.viewBound.setViewRadius()
    }
    
    func setData(set:SetDetailEntity){
        imgSet.setCustomImage(set.image, defaultAvatar: nil)
        lbName.text = set.name
        lbKcalPrice.text = "\(set.calorie)kcal - \(set.price.convertTypePrice())"
    }
    @IBAction func clickSet(_ sender: Any) {
        self.clickSet?()
    }
    @IBAction func addToCart(_ sender: Any) {
        self.addToCart?()
        
    }
    
    var clickSet:(()->())?
    var addToCart:(()->())?

}

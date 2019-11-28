//
//  CategoryCollectionViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgGroup: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var viewBound: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupview()
    }
    
    func setupview(){
        imgGroup.setViewRadius(cornerRadius: 10)
        viewBound.setViewRadius(cornerRadius: 10)
    }
    
    func setData(data:CategoryDetailEntity){
        imgGroup.setCustomImage(data.image, defaultAvatar: "")
        lbName.text = data.name
    }

}

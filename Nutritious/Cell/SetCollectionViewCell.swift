//
//  SetCollectionViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/26/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class SetCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgSet: UIImageView!
    @IBOutlet weak var viewBound: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView(){
        self.viewBound.setViewRadius()
    }

}

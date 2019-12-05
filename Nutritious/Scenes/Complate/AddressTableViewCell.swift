//
//  AddressTableViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 12/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    @IBOutlet weak var lbAddress: UILabel!
    
    @IBOutlet weak var lbPhone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data:AddressDetailEntity){
        lbAddress.text = data.title
        lbPhone.text = data.phone
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickAddress(_ sender: Any) {
        self.clickAddress?()
    }
    var clickAddress:(()->())?
}

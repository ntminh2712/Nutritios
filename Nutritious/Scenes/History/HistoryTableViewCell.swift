//
//  HistoryTableViewCell.swift
//  Nutritious
//
//  Created by MinhNT on 11/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data:DiscoveryDetailEntity){
        imgBackground.setCustomImage(data.image, defaultAvatar: nil)
        lbTitle.text = data.name
        lbDescription.text = data.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func openWeb(_ sender: Any) {
        self.openWeb?()
    }
    
    var openWeb:(()->())?
    
}

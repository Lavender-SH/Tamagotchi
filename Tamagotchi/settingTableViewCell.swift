//
//  settingTableViewCell.swift
//  Tamagotchi
//
//  Created by 이승현 on 2023/08/05.
//

import UIKit

class settingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    var detailIconImage: UIImage!
    
    @IBOutlet weak var settingLabel: UILabel!
    var detailSettingLabel: String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImage?.image = detailIconImage
        settingLabel.text = detailSettingLabel
        settingLabel.frame.origin.x = 30
        

        
    }
    
    
}


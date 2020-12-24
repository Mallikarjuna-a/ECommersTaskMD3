//
//  RPCollectionViewCell.swift
//  ECommersTaskMD3
//
//  Created by Mallikarjuna on 24/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import UIKit

class RPCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var CVCellImageView: UIImageView!
    
    @IBOutlet weak var BrandNameLbl: UILabel!
    
    
    @IBOutlet weak var CurrencyCodeLbl: UILabel!
    
    @IBOutlet weak var FinalPriceLbl: UILabel!
    
    @IBOutlet weak var OrdinaryPriceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

//
//  ItemCell.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/13/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//

import UIKit

class DreamItemCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func configureCell (item:DreamItem) {
        titleLabel.text = item.title
        priceLabel.text = priceLabel.text
        detailLabel.text = item.details
        
    }
}

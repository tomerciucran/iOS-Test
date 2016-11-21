//
//  TripTableViewCell.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    static let identifier = "TripTableViewCell"

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var changesLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

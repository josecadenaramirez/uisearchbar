//
//  statesCell.swift
//  searchBar
//
//  Created by José Cadena on 07/08/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import UIKit

class statesCell: UITableViewCell {
    @IBOutlet weak var lblCapital: UILabel!
    @IBOutlet weak var lblState: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

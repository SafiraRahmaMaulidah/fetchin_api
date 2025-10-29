//
//  QuoteCellTableViewCell.swift
//  fetching api
//
//  Created by MacBook Pro M1 on 13/10/25.
//

import UIKit

class QuoteCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quoteLabel: UILabel!
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}

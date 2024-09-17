//
//  ToppingCell.swift
//  JsonToStructEnum
//
//  Created by Abouzar Moradian on 9/17/24.
//

import UIKit

class ToppingCell: UITableViewCell {

    @IBOutlet weak var toppingLabel: UILabel!
    static let identifier = "ToppingCell"
    
    var batter: Batter? {
        didSet{
            toppingLabel.text = batter?.type.rawValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

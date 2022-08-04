//
//  XibOtherTableViewCell.swift
//  tableview
//
//  Created by Victor Feitosa on 02/08/22.
//

import UIKit

class XibOtherTableViewCell: UITableViewCell {
    
    public var identifier: String = "XibOtherTableViewCell"

    @IBOutlet weak var lbCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(text: String){
        lbCell.text = "asdasds"
    }
    
}

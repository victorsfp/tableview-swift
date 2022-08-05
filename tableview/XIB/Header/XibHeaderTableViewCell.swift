//
//  XibHeaderTableViewCell.swift
//  tableview
//
//  Created by Victor Feitosa on 02/08/22.
//

import UIKit

struct XibHeaderModel {
    let name: String
    let agCc: String
    let description: String?
}

class XibHeaderTableViewCell: UITableViewCell {
    
    public var identifier: String = "XibHeaderTableViewCell"

    @IBOutlet weak var viDescription: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAgCc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    //MARK: - SETUP
    public func setupCell(with model: XibHeaderModel){
        viDescription.layer.cornerRadius = 10
        lbName.text = model.name
        lbAgCc.text = model.agCc
    }
}

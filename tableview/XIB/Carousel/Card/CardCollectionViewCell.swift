//
//  CardCollectionViewCell.swift
//  tableview
//
//  Created by Victor dos Santos Feitosa (P) on 05/08/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    let identifier = "CardCollectionViewCell"
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lbText: UILabel!
    
    
    func setup(text: String){
        self.contentView.layer.cornerRadius = 10
        lbText.text = text
    }
}

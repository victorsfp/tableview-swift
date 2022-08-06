//
//  CardViewController.swift
//  tableview
//
//  Created by Victor dos Santos Feitosa (P) on 05/08/22.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lbText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func setup(text: String){
        lbText.text = text
    }

}

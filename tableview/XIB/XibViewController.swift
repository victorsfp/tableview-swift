//
//  XibViewController.swift
//  tableview
//
//  Created by Victor Feitosa on 02/08/22.
//

import UIKit

enum XibTableViewCells {
    case header
    case other
}

class XibViewController: UIViewController {
    
    private var rows = [XibTableViewCells]()

    //MARK: - COMPONENTS VIEW CODE
    private lazy var tableview:UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    //MARK: - LIFE CYCLE COMPONENT
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        
        self.setupComponents()
    }
    
    //MARK: - SETUP
    private func setupComponents(){
        view.addSubview(tableview)
        
        tableview.register(UINib(nibName: "XibHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "XibHeaderTableViewCell")
        rows.append(.header)
        
        tableview.register(UINib(nibName: "XibOtherTableViewCell", bundle: nil), forCellReuseIdentifier: "XibOtherTableViewCell")

        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}



extension XibViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type: XibTableViewCells = rows.indices.contains(indexPath.row) ? rows[indexPath.row] : .other
        
       
        switch type {
            case .header:
                guard let cell = tableview.dequeueReusableCell(withIdentifier: "XibHeaderTableViewCell") as? XibHeaderTableViewCell else {  return UITableViewCell() }
                cell.setupCell(with: XibHeaderModel(name: "Olá, Victor Feitosa", agCc: "Ag 000\(indexPath.row + 1) Cc 00000000-\(indexPath.row + 1)", description: "descricao"))
                return cell
            case .other:
                guard let cell = tableview.dequeueReusableCell(withIdentifier: "XibOtherTableViewCell") as? XibOtherTableViewCell else {  return UITableViewCell() }
                cell.setupCell(text: "Celula \(indexPath.row)")
                return cell
        }
        
    }
    
}

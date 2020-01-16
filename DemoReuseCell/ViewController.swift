//
//  ViewController.swift
//  DemoReuseCell
//
//  Created by Taof on 12/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cells = [TableViewCell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//        setupCell()
    }
    
    func setupCell(){
        for _ in 0 ... 1000 {
            let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?[0] as! TableViewCell
            cells.append(cell)
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
//        let cell = cells[indexPath.row]
        cell.nameLabel.text = "\(indexPath.row)"
        return cell
    }
}


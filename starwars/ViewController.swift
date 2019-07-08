//
//  ViewController.swift
//  starwars
//
//  Created by Michael Singer on 7/6/19.
//  Copyright © 2019 Michael Singer. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
//    {
//        didSet {
//            tableView.register(RootTableViewCell.self, forCellReuseIdentifier: "root")
////            tableView.register(RootTableViewCell.self, forCellReuseIdentifier: "root")
//        }
//    }
    
    var options = ["People","Films","Starships","Vehicles", "Species", "Planets"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "RootTableViewCell", for: indexPath) as! RootTableViewCell
            cell.label.text = options[indexPath.row]
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RootTableViewCell") as? RootTableViewCell else {
//            return UITableViewCell()
//        }
//        cell.imageView?.image = UIImage(named: "noun_alien_627223")
//        cell.titleL.text =
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}

protocol presentObj:class {
    func load(class:ObjectClass) -> ObjectClass
}


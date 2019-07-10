//
//  ViewController.swift
//  starwars
//
//  Created by Michael Singer on 7/8/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate:LoadObjectDelegate?
    var options = ["People","Films","Starships","Vehicles", "Species", "Planets"]
    var images = ["noun_person_1880095","noun_Film_1666495","noun_spaceship_1311585","noun_Car_1881053","noun_alien_627223","noun_Planet_1867071"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .black
        self.title = "STAR WARS API"
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "RootTableViewCell", for: indexPath) as! RootTableViewCell
            cell.label.text = options[indexPath.row]
            cell.imageV.image = UIImage(named: images[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryDetailTableViewController") as! CategoryDetailTableViewController
        self.delegate = viewController
        switch indexPath.row {
        case 0:
            delegate?.load(path: "/people/", model: People.self)
        case 1:
            delegate?.load(path: "/films/", model: Film.self)
        case 2:
            delegate?.load(path: "/starships/", model: Starship.self)
        case 3:
            delegate?.load(path: "/vehicles/", model: Vehicle.self)
        case 4:
            delegate?.load(path: "/species/", model: Species.self)
        case 5:
            delegate?.load(path: "/planets/", model: Planet.self)
        default:
            print("Def")
        }
            self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

protocol LoadObjectDelegate:class {
    func load<T:Decodable>(path:String, model:T.Type)
}

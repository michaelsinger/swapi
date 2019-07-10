//
//  CategoryDetailTableViewController.swift
//  starwars
//
//  Created by Michael Singer on 7/8/19.
//

import UIKit
class CategoryDetailTableViewController: UITableViewController, LoadObjectDelegate {
    
    var items:[Decodable]? = [Decodable]()
    var type:ObjectClass!
    weak var delegate:DetailDelegate?
    var activityIndicator = UIActivityIndicatorView()
//    var model:Decodable.Type = People.self
    var model:NSObject.Type? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        activityIndicator.style = .whiteLarge
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = .gray
        activityIndicator.alpha = 0.9
        activityIndicator.layer.cornerRadius = 10
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.addConstraint(NSLayoutConstraint(item: activityIndicator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70))
        activityIndicator.addConstraint(NSLayoutConstraint(item: activityIndicator, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70))
        

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func load<T>(path: String, model: T.Type) where T : Decodable {
        
        activityIndicator.startAnimating()
        APIHandler.shared.load(path: path, model) { (items) in
            for item in items {
                self.items?.append(item)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }
        }
        
        switch model {
        case is People.Type:
            self.type = .people
        case is Film.Type:
            self.type = .film
        case is Starship.Type:
            self.type = .starship
        case is Vehicle.Type:
            self.type = .vehicle
        case is Species.Type:
            self.type = .species
        case is Planet.Type:
            self.type = .planet
        default:
            self.title = "Default"
        }
        self.title = self.type!.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " 'I've altered the deal - Pray I do not alter it any further.' "
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.font = UIFont(name: "Futura", size: 14)
        header?.textLabel?.textColor = .darkGray
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryDetailViewController") as! CategoryDetailViewController
        self.delegate = viewController
        if let items = items {
            delegate?.passToDetail(item: items[indexPath.row], type: self.type)
        }
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! DetailTableViewCell

        if let items = items {
            
            switch self.type {
            case .people?:
                if let person = items[indexPath.row] as? People {
                    cell.configure(person:person)
                }
            case .film?:
                if let film = items[indexPath.row] as? Film {
                    cell.configure(film: film)
                }
            case .vehicle?:
                if let vehicle = items[indexPath.row] as? Vehicle {
                    cell.configure(vehicle: vehicle)
                }
            case .starship?:
                if let starship = items[indexPath.row] as? Starship {
                    cell.configure(starship: starship)
                }
            case .species?:
                if let species = items[indexPath.row] as? Species {
                    cell.configure(species: species)
                }
            case .planet?:
                if let planet = items[indexPath.row] as? Planet {
                    cell.configure(planet: planet)
                }
            default:
                print("")
            }
        }
        return cell
    }
}

protocol DetailDelegate:class {
    func passToDetail(item:Decodable, type:ObjectClass)
}


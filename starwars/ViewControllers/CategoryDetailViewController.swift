//
//  CategoryDetailViewController.swift
//  starwars
//
//  Created by Michael Singer on 7/9/19.
//

import UIKit

class CategoryDetailViewController: UIViewController,DetailDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    var type:ObjectClass!
    var item:Decodable?
    var title1 = ""
    var sub = ""
    var properties:[String]!
    var values:[Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.circleView.circle()
        
        switch self.type! {
        case .people:
            title1 = (self.item as! People).name
            sub = (self.item as! People).birth_year
            properties = (self.item as! People).propertyNames()
            values = (self.item as! People).propertyValues()
        case .planet:
            title1 = (self.item as! Planet).name
            sub = (self.item as! Planet).diameter
            properties = (self.item as! Planet).propertyNames()
            values = (self.item as! Planet).propertyValues()
        case .starship:
            title1 = (self.item as! Starship).name
            sub = (self.item as! Starship).model
            properties = (self.item as! Starship).propertyNames()
            values = (self.item as! Starship).propertyValues()
        case .species:
            title1 = (self.item as! Species).name
            sub = (self.item as! Species).classification
            properties = (self.item as! Species).propertyNames()
            values = (self.item as! Species).propertyValues()
        case .vehicle:
            title1 = (self.item as! Vehicle).name
            sub = (self.item as! Vehicle).model
            properties = (self.item as! Vehicle).propertyNames()
            values = (self.item as! Vehicle).propertyValues()
        case .film:
            title1 = (self.item as! Film).title
            sub = (self.item as! Film).opening_crawl
            properties = (self.item as! Film).propertyNames()
            values = (self.item as! Film).propertyValues()
        }
        self.title = title1
        self.circleLabel.text = title1.initials()
        self.subLabel.text = sub
    }
    
    func passToDetail(item: Decodable, type: ObjectClass) {
        self.type = type
        self.item = item
    }
}

extension CategoryDetailViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryDetailTableViewCell
        cell.labelTop.text = properties[indexPath.row].formatted()
        let str = "\(values[indexPath.row])"
        cell.labelBottom.text = str.firstUppercased
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}



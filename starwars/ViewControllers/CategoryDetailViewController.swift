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
    var cellKey = ""
    var cellValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.circleView.circle()
        
        switch self.type! {
        case .people:
            title1 = (self.item as! People).name
            sub = (self.item as! People).birth_year
            cellKey = "Eye Color"
            cellValue = (self.item as! People).eye_color
        case .planet:
            title1 = (self.item as! Planet).name
            sub = (self.item as! Planet).diameter
            cellKey = "Rotation Period"
            cellValue = (self.item as! Planet).rotation_period
        case .starship:
            title1 = (self.item as! Starship).name
            sub = (self.item as! Starship).model
            cellKey = "Manufacturer"
            cellValue = (self.item as! Starship).manufacturer
        case .species:
            title1 = (self.item as! Species).name
            sub = (self.item as! Species).classification
            cellKey = "Designation"
            cellValue = (self.item as! Species).designation
        case .vehicle:
            title1 = (self.item as! Vehicle).name
            sub = (self.item as! Vehicle).model
            cellKey = "Vehicle Class"
            cellValue = (self.item as! Vehicle).vehicle_class
        case .film:
            title1 = (self.item as! Film).title
            sub = (self.item as! Film).opening_crawl
            cellKey = "Episode Id"
            cellValue = String((self.item as! Film).episode_id)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryDetailTableViewCell
        cell.labelTop.text = cellKey
        cell.labelBottom.text = cellValue.firstUppercased
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
        return 4
    }
}



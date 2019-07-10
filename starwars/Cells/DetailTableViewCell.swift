//
//  DetailTableViewCell.swift
//  starwars
//
//  Created by Michael Singer on 7/9/19.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelBottom: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var viewCircle: UIView!
    @IBOutlet weak var labelCircle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewCircle.circle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(person:People) {
        self.labelCircle.text = person.name.initials()
        self.labelTop.text = person.name
        self.labelBottom.text = person.birth_year
        self.labelDate.text = person.created.dateFormat()
    }
    
    func configure(planet:Planet) {
        self.labelCircle.text = planet.name.initials()
        self.labelTop.text = planet.name
        self.labelBottom.text = planet.diameter
        self.labelDate.text = planet.created.dateFormat()
    }
    
    func configure(starship:Starship) {
        self.labelCircle.text = starship.name.initials()
        self.labelTop.text = starship.name
        self.labelBottom.text = starship.model
        self.labelDate.text = starship.created.dateFormat()
    }
    
    func configure(vehicle:Vehicle) {
        self.labelCircle.text = vehicle.name.initials()
        self.labelTop.text = vehicle.name
        self.labelBottom.text = vehicle.model
        self.labelDate.text = vehicle.created.dateFormat()
    }
    
    func configure(species:Species) {
        self.labelCircle.text = species.name.initials()
        self.labelTop.text = species.name
        self.labelBottom.text = species.classification
        self.labelDate.text = species.created.dateFormat()
    }
    
    func configure(film:Film) {
        self.labelCircle.text = film.title.initials()
        self.labelTop.text = film.title
        self.labelBottom.text = film.opening_crawl
        self.labelDate.text = film.created.dateFormat()
    }
}

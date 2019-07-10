//
//  Extensions.swift
//  starwars
//
//  Created by Michael Singer on 7/9/19.
//

import Foundation
import UIKit

extension String {
    func initials() -> String {
        return self.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
    
    func dateFormat() -> String {
        let date =  String(self.prefix(upTo: self.index(self.startIndex, offsetBy: 10)))
        let year = date.prefix(upTo: self.index(self.startIndex, offsetBy: 4)).suffix(from: self.index(self.startIndex, offsetBy: 2))
        let daymonth = date.suffix(from: self.index(self.startIndex, offsetBy: 5))
        let arr = daymonth.components(separatedBy: "-")
        return arr[1] + "/" + arr[0] + "/" + year
    }
}

extension StringProtocol {
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
}

extension UIView {
    public func circle() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}

enum ObjectClass: String {
    case starship = "Starship"
    case species = "Species"
    case people = "People"
    case vehicle = "Vehicle"
    case planet = "Planet"
    case film = "Film"
}

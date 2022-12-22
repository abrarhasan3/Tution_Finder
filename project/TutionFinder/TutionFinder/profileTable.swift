//
//  profileTable.swift
//  TutionFinder
//
//  Created by kuet on 4/12/22.
//

import UIKit

class profileTable: UITableViewCell {
    @IBOutlet weak var locProfile:UILabel!
    @IBOutlet weak var classProfile:UILabel!
    @IBOutlet weak var weekProfile:UILabel!
    @IBOutlet weak var salaryProfile:UILabel!
    @IBOutlet weak var subjectProfile:UILabel!
    @IBOutlet weak var contactProfile:UILabel!
    @IBOutlet weak var btnDel: UIButton!
    
    var btnDelete: (() -> ())?
    @IBAction func del(_ sender: Any) {
        btnDelete?()
    }
    
}

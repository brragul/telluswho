//
//  MatchFeedViewController.swift
//  TellUsWho
//
//  Created by Ishani Chatterjee on 1/5/16.
//  Copyright © 2016 409TamilPasanga. All rights reserved.
//

import UIKit

class MatchFeedViewController: UIViewController {
    
    @IBOutlet weak var RValue: UILabel!
    @IBOutlet weak var RMessage: UILabel!
    @IBOutlet weak var interest5Lbl: UILabel!
    @IBOutlet weak var interest4Lbl: UILabel!
    @IBOutlet weak var interest3Lbl: UILabel!
    @IBOutlet weak var interest2Lbl: UILabel!
    @IBOutlet weak var nameLblTop: UILabel!
    @IBOutlet weak var interest1Lbl: UILabel!
    @IBOutlet weak var majorLbl: UILabel!
    @IBOutlet weak var nationalLbl: UILabel!
    @IBOutlet weak var townLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    var name = String()
    var gender = String()
    var age = String()
    var town = String()
    var national = String()
    var major = String()
    var int1 = String()
    var int2 = String()
    var int3 = String()
    var int4 = String()
    var int5 = String()
    var ReasonMessage = String()
    var ReasonValue = String()
    
    
    override func viewDidLoad() {
        nameLbl.text = name
        nameLblTop.text = name
        genderLbl.text = gender
        ageLbl.text = age
        townLbl.text = town
        nationalLbl.text = national
        majorLbl.text = major
        interest1Lbl.text = int1
        interest2Lbl.text = int2
        interest3Lbl.text = int3
        interest4Lbl.text = int4
        interest5Lbl.text = int5
        RMessage.text = ReasonMessage
        RValue.text = ReasonValue
        super.viewDidLoad()
    }
    
}

//
//  DetailViewController.swift
//  app5_Calvin_Hu
//
//  Created by Calvin Hu on 10/20/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact: Contact? = nil
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        if let con = contact as Contact? {
            picture.image = con.picture
            name.text = con.firstName + " " + con.lastName
            company.text = con.company
            email.text = con.email
            phone.text = con.phoneNumber
        }
    }
    
}

//
//  ViewController.swift
//  NationalParks
//
//  Created by Calvin Hu on 11/10/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//
import UIKit
import Kingfisher

class ViewController: UIViewController {

    var park: Park?
    var data : [String : Any]?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //if let p = park as Park? {
        if let data = data as [String : Any]? {
            //name.text = p.name
            //designation.text = p.designation
            //let url = URL(string: p.images[0].url)
            //imageView.kf.setImage(with: url)
            //desc.text = p.description
            name.text = data["name"] as? String
            designation.text = data["designation"] as? String
            desc.text = data["description"] as? String
            if data["image"] as? String != "" {
                let url = URL(string: (data["image"] as? String)!)
                imageView.kf.setImage(with: url)
            }
        }
    }
}


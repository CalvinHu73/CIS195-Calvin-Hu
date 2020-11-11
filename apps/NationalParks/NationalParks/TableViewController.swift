//
//  ViewController.swift
//  NationalParks
//
//  Created by Calvin Hu on 11/8/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase

class TableViewController: UITableViewController {

    var parks = [Park]()
    let endpoint: String = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=nwyccQO3KcCFhL33kOh38zZFgQemCU2vP9v5X7pF"
    var docRef: DocumentReference!
    var data : [String : Any]?
    
    func configureRefreshControl () {
       // Add the refresh control to your UIScrollView object.
        self.refreshControl? = UIRefreshControl()
        self.refreshControl?.addTarget(self, action:
            #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        // Update your content…
        makeAPIRequest()
        // Dismiss the refresh control.
        print("refreshed")
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        //makeAPIRequest()
        configureRefreshControl()
    }

    @objc private func makeAPIRequest() {
        // URLSession code
        let url = URL(string: endpoint)!
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: API request failed...")
                return
            }
            if let APIResponse = try? JSONDecoder().decode(APIResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.parks = APIResponse.data
                    self.updateFirebaseDatabase()
                    self.tableView.reloadData()
                }
            }
        }
        // Actually run the URLSession
        task.resume()
    }
    
    func updateFirebaseDatabase() {
        for i in 0..<parks.count {
            let park = parks[i]
            var image : String;
            if park.images.count > 0 {
                image = park.images[0].url
            } else {
                image = ""
            }
            let dataToSave : [String: Any] = ["name": park.name, "designation": park.designation, "image": image, "description": park.description]
            docRef = Firestore.firestore().collection("parks").document("\(i)")
            docRef.setData(dataToSave, completion: { error in
                if let _ = error {
                    print("Error found here!")
                } else {
                    print("No error here!")
                }
            })
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell", for: indexPath)
        Firestore.firestore().collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
            if let data = docSnapshot?.data() {
                if let title = cell.viewWithTag(4) as? UILabel {
                    //title.text = parks[indexPath.row].name
                    title.text = data["name"] as? String
                }
                if let designation = cell.viewWithTag(2) as? UILabel {
                    //designation.text = parks[indexPath.row].designation
                    designation.text = data["designation"] as? String
                }
                if let imageView = cell.viewWithTag(3) as? UIImageView {
                    // if parks[indexPath.row].images.count > 0 {
                    //     let url = URL(string: parks[indexPath.row].images[0].url)
                    //     imageView.kf.setImage(with: url)
                    // }
                    if data["image"] as? String != "" {
                        let url = URL(string: (data["image"] as? String)!)
                        imageView.kf.setImage(with: url)
                    } else {
                        imageView.image = nil
                    }
                }
            }
        }
        
        return cell
    }

    var park: Park? = nil
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Deselect the cell, and toggle the "favorited" property in your model
        tableView.deselectRow(at: indexPath, animated: false)
        // self.park = parks[indexPath.row]
        Firestore.firestore().collection("parks").document("\(indexPath.row)").getDocument{ (docSnapshot, error) in
            if let data = docSnapshot?.data() {
                self.data = data
            }
            self.performSegue(withIdentifier: "parkSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "parkSegue" {
            let vc = segue.destination as! ViewController
            vc.data = self.data
        }
    }
}


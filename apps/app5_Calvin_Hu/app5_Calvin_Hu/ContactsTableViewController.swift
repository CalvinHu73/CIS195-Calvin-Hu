//
//  ContactsTableViewController.swift
//  app5_Calvin_Hu
//
//  Created by Calvin Hu on 10/20/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController, AddContactDelegate {
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        contactsArray.append(contact)
        contactsArray.sort {$0.lastName.lowercased() < $1.lastName.lowercased()}
        self.tableView.reloadData()
    }
    

    @IBAction func acvcSegue(_ sender: Any) {
        performSegue(withIdentifier: "acvcNavSegue", sender: nil)
    }
    var contactsArray: [Contact] = [Contact(firstName: "Calvin", lastName: "Hu", company: "univ of penn", email: "calvinhu@seas.upenn.edu", phoneNumber: "1234567890", picture: nil), Contact(firstName: "Ben", lastName: "Franklin", company: "the bench", email: "oldhead@foundingfathers", phoneNumber: "0987654321", picture: nil)]
    var dvcContact: Contact? = nil
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       // TODO: How many sections? (Hint: we have 1 section and x rows)
       return 1
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // TODO: How many rows in our section?
       return contactsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
        let cell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath)
        cell.textLabel?.text = contactsArray[indexPath.row].firstName + " " + contactsArray[indexPath.row].lastName
        cell.detailTextLabel?.text = contactsArray[indexPath.row].company
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60.0
    }
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Deselect the cell, and toggle the "favorited" property in your model
        tableView.deselectRow(at: indexPath, animated: false)
        self.dvcContact = contactsArray[indexPath.row]
        performSegue(withIdentifier: "dvcSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dvcSegue" {
            let dvc = segue.destination as! DetailViewController
            dvc.contact = self.dvcContact
        } else if segue.identifier == "acvcNavSegue" {
            let acvcNav = segue.destination as! UINavigationController
            let acvc = acvcNav.topViewController as! AddContactViewController
            acvc.delegate = self
        }
    }
}

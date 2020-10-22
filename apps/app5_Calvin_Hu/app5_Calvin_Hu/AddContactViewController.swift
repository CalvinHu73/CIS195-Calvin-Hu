//
//  AddContactViewController.swift
//  app5_Calvin_Hu
//
//  Created by Calvin Hu on 10/20/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class AddContactViewController: UIViewController {
    weak var delegate: AddContactDelegate?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBAction func saveContact(_ sender: Any) {
        let newContact = createNewContact()
        dump(newContact)
        if newContact != nil {
            delegate?.didCreate(newContact!)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func createNewContact() -> Contact? {
        if (firstName.hasText && lastName.hasText && company.hasText && email.hasText && phoneNumber.hasText) {
            return Contact(firstName: firstName.text!, lastName: lastName.text!, company: company.text!, email: email.text!, phoneNumber: phoneNumber.text!, picture: nil)
        }
        return nil
    }
}

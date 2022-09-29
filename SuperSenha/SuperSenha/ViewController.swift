//
//  ViewController.swift
//  SuperSenha
//
//  Created by Jeiel Lima on 27/07/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textFieldTotalPassword: UITextField!
    @IBOutlet weak var textFieldNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController // informa qual é a view de destino dessa segue
        if let numberOfPasswords =  Int(textFieldTotalPassword.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(textFieldNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        view.endEditing(true)
        
    }

}


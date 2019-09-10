//
//  ViewController.swift
//  VK_Application
//
//  Created by Victor Rozhkov on 9/10/19.
//  Copyright © 2019 Victor Rozhkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Авторизация"
        loginLabel.text = "Логин"
        passwordLabel.text = "Пароль"
        loginTextField.placeholder = "Введите логин"
        passwordTextField.placeholder = "Введите пароль"
    }


}


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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        guard let login = loginTextField.text else {
            titleLabel.text = "Неверный логин или пароль! Попробуйте ещё раз."
            return
        }
        guard let password = passwordTextField.text else {
            titleLabel.text = "Неверный логин или пароль! Попробуйте ещё раз."
            return
        }
        
        if login == "login", password == "123456" {
            titleLabel.text = "Авторизация завершена."
        } else {
            titleLabel.text = "Неверный логин или пароль! Попробуйте ещё раз."
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Авторизация"
        loginLabel.text = "Логин"
        passwordLabel.text = "Пароль"
        loginTextField.placeholder = "Введите логин"
        passwordTextField.placeholder = "Введите пароль"
        
        loginButton.setTitle("Войти", for: .normal)
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}


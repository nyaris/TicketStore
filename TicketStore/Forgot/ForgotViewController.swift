//
//  ForgotViewController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

        private let DEFAULT_MARGIN: CGFloat = 20.0
        private let DEFAULT_SPACING: CGFloat = 40.0
        private let SMALL_SPACING: CGFloat = 50.0
        
       
        private lazy var sendEmailButton: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Enviar", for: .normal)
            button.tintColor = UIColor(named: "red")
            button.titleLabel?.font = UIFont(name: "avenir", size: 20)
           
            
            
            button.addTarget(self, action: #selector(sendRecoverEmail), for: .touchUpInside)
            
            return button
        }()
        
        var presenter: ForgotPasswordPresenterContract!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            presenter = presenter ?? ForgotPasswordPresenter(delegate: self)
            
            self.view.backgroundColor = .white
            
            setGestures()
           
            setSendEmailButton()
            
    
        }
    

        
        private func setSendEmailButton() {
            self.view.addSubview(self.sendEmailButton)
            NSLayoutConstraint.activate([
                self.sendEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                self.sendEmailButton.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: SMALL_SPACING),
             
            ])
        }
    
        private func setGestures() {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
            self.view.addGestureRecognizer(gesture)
        }
        
        @objc private func closeKeyboard() {
            self.view.endEditing(true)
        }
        
        private func dissmissModal() {
            self.dismiss(animated: true, completion: nil)
        }
        
        @objc private func sendRecoverEmail(){
            guard let email = emailTextField.text, !email.isEmpty else { return }
            self.presenter.sendRecoverEmail(email)
        }
    }

    extension ForgotViewController: ForgotPasswordViewDelegate {
        func finish() {
            self.dissmissModal()
        }
        
        func alert(error: String) {
            print(error)
        }
    }


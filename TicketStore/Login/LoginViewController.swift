//
//  LoginViewController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 03/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit

protocol LoginScreenDelegate {
    func userDidLoginWithSuccess()
}

class LoginViewController: UIViewController {
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    
    static func instantiate() -> LoginViewController {
        return LoginViewController(nibName: nil, bundle: nil)
    }
    
    static func instantiate(controller: LoginScreenControllerContract?, viewDelegate: LoginScreenDelegate) -> LoginViewController {
        let vc = LoginViewController (nibName: nil, bundle: nil)
        vc.controller = controller
        vc.viewDelegate = viewDelegate
        
        return vc
    }
    
    var viewDelegate: LoginScreenDelegate?
    var controller: LoginScreenControllerContract!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = controller ?? LoginScreenController(viewController: self, securityService: SecurityService())
        
      
        let touchRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(touchRecognizer)
        

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background-login4.png")!)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
        buttonLogin.layer.cornerRadius = 15
   
    }
    
   
    @IBAction func loginButton(_ sender: Any) {
        
      guard let email = textFieldEmail.text, !email.isEmpty, let password = textFieldSenha.text, !password.isEmpty else {
                 return
             }
             
             controller.login(email: email, password: password)
         }
    
    
    @objc func closeKeyboard() {
          self.view.endEditing(true)
      }


   



}

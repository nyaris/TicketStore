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
        
        textFieldEmail.layer.cornerRadius = 18
        textFieldEmail.layer.masksToBounds = true
        
        textFieldSenha.layer.cornerRadius = 18
    
        textFieldSenha.layer.masksToBounds = true
   
    }
    
   
    @IBAction func loginButton(_ sender: Any) {
        
        guard let email = textFieldEmail.text, email.contains("@"), let password = textFieldSenha.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Campos incorretos!", message: "Preencha todos os campos, ou verifique se inseriu os dados corretos.", preferredStyle: .alert)


      

                 alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))


      

                 self.present(alert, animated: true)

                 

                 return

             }
             
             controller.login(email: email, password: password)

        }
        
        
         
    
    
    @objc func closeKeyboard() {
          self.view.endEditing(true)
      }

    @IBAction func register(_ sender: Any) {
        
        controller.forgotPassword()
        
    }
    
    
        

  


   



}

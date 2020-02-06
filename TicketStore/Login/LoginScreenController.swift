//
//  LoginScreenViewController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 03/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import UIKit

protocol LoginScreenControllerDelegate: class {
    func didLoginSuccess(email: String, password:String)
    func didForgotPassward()
}

protocol LoginScreenControllerContract {
    func login(email: String, password: String)
    func forgotPassword()
}

class LoginScreenController: LoginScreenControllerContract {
    
    private var securityService: SecurityServiceContract
    private weak var viewController: LoginViewController?
    
    init(viewController: LoginViewController, securityService: SecurityServiceContract) {
        self.viewController = viewController
        self.securityService = securityService
    }
    
    func login(email: String, password: String) {
        securityService.login(email: email, password: password)
        self.viewController?.viewDelegate?.userDidLoginWithSuccess()
    }
    
    func forgotPassword() {
        goToForgotPasswordScreen()
        
    }
    
    private func goToForgotPasswordScreen() {

              guard let vc = self.viewController else { return }


              let viewController = ForgotViewController(nibName: "ForgotViewController", bundle: nil)

              viewController.modalPresentationStyle = .popover



              vc.present(viewController, animated: true, completion: nil)

          }
}


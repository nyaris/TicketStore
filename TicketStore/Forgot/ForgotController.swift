//
//  ForgotController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

protocol ForgotPasswordPresenterContract {
    func sendRecoverEmail(_ email: String)
    
}

protocol ForgotPasswordViewDelegate: class {
    func finish()
    func alert(error: String)
}

class ForgotPasswordPresenter: ForgotPasswordPresenterContract {
    private weak var delegate: ForgotPasswordViewDelegate?
    
    init(delegate: ForgotPasswordViewDelegate) {
        self.delegate = delegate
    }
    
    func sendRecoverEmail(_ email: String) {
        if email.contains("@") {
            self.delegate?.finish()
        } else {
            self.delegate?.alert(error: "Email inválido")
        }
    }
}


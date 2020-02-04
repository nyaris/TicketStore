//
//  AppCoordinator.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 04/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow
    var initialViewController: UIViewController
    var loginCoordinator: LoginCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init() {
        self.window = UIWindow()
        self.initialViewController = LoginViewController.instantiate()
        self.window.rootViewController = initialViewController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        if let securityService: SecurityService = SecurityService(), securityService.currentUser != nil {
            showHome()
        } else {
            showLogin()
        }
    }
    
    func finish() {
        
    }
    
    func showLogin() {
        loginCoordinator = loginCoordinator ?? LoginCoordinator(delegate: self, securityService: SecurityService())
        loginCoordinator?.start()
        
        self.window.rootViewController = loginCoordinator?.rootViewController!
    }
    
    func showHome() {
        homeCoordinator = homeCoordinator ?? HomeCoordinator(delegate: self)
        homeCoordinator?.start()
        self.window.rootViewController = homeCoordinator?.rootViewController
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func didLoginWithSuccess() {
        loginCoordinator?.finish()
        showHome()
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func didRequestLogout() {
        homeCoordinator?.finish()
        showLogin()
    }
}

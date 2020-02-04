//
//  HomeCoordinator.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 04/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit

protocol HomeCoordinatorDelegate {
    func didRequestLogout()
}

class HomeCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController?
    let delegate: HomeCoordinatorDelegate
    
    init(delegate: HomeCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func start() {
        let view = HomeViewController()
 //       view.delegate = self
        let navigation = UINavigationController(rootViewController: view)
        navigation.isNavigationBarHidden = true
        rootViewController = navigation
    }
    
    func finish() {
        
    }

    func didTouchLogout() {
        delegate.didRequestLogout()
    }
}


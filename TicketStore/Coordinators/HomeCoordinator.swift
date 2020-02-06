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
    var controller: HomeController
    
    init(delegate: HomeCoordinatorDelegate) {
        self.delegate = delegate
        controller = HomeController(delegate: nil, service: MoviesService())
    }
    
    func start() {
        let view = HomeViewController(controller: controller)
        view.delegate = self
        let navigation = UINavigationController(rootViewController: view)
        navigation.isNavigationBarHidden = true
        rootViewController = navigation
    }
    
    func finish() {
    }
}
    
    extension HomeCoordinator: HomeScreenViewControllerDelegate{
    
    func didTouchLogout() {
        delegate.didRequestLogout()
    }
    
}



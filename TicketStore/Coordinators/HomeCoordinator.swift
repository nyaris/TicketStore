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
    var view: UIViewController?
    var navigation: UINavigationController?
    var root: UITabBarController
    var window: UIWindow
    
    let viewModel: Movies
    
    init(delegate: HomeCoordinatorDelegate) {
        self.delegate = delegate
        controller = HomeController(delegate: nil, service: MoviesService())
        controller.set(delegateHome: self)
        self.root = UITabBarController()
    }
    
    func start() {
     let view = HomeViewController(controller: controller)
          view.delegate = self
          navigation = UINavigationController(rootViewController: view)
          navigation?.isNavigationBarHidden = true
          rootViewController = navigation
        
        self.view = HomeViewController(viewModel: viewModel)
               navigation = UINavigationController(rootViewController: view)
               if #available(iOS 13.0, *) {
                   navigation?.tabBarItem = UITabBarItem(title: "Usuários", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
               } else {
                   // Fallback on earlier versions
               }
               
               root.setViewControllers([navigation!], animated: false)
               window.rootViewController = root
    }
    
    func finish() {
        
        view = nil
        navigation = nil
    }
}
    
extension HomeCoordinator: HomeScreenViewControllerDelegate{
    func didTouchLogout() {
        delegate.didRequestLogout()
    }
}

extension HomeCoordinator: HomeControllerDelegate {
    func didSelectItem(_ movie: Movies) {
        let viewModel = DetailsMoviesViewModel(movie: movie)
        view = DetailsMoviesViewController(viewModel: viewModel)
        navigation?.pushViewController(view!, animated: true)
        
    }
}



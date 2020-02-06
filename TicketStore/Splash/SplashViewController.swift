//
//  SplashViewController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 04/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    static func instantiate() -> SplashViewController {
        return SplashViewController(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0) {
            self.logoImageView.alpha = 1.0
        }
    }
}

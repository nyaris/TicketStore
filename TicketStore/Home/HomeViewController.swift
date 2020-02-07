//
//  HomeViewController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 04/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import Kingfisher

protocol HomeScreenViewControllerDelegate: class {
   
    func didTouchLogout()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: HomeScreenViewControllerDelegate?
    var viewModel: DetailsMoviesViewModel?
       
    
    var securityService: SecurityServiceContract!

    var controller: HomeController?
    var movies: [Movies] = []
       
       //  MARK: - View Controller Life Cycle
       init(controller: HomeController, nibName: String? = nil){
           super.init(nibName: nibName, bundle: nil)
           self.controller = controller
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        securityService = SecurityService()
        
        self.controller?.set(delegate: self)
        
        setup()
        
        controller?.fetchMovies()
        

        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         
           usernameLabel.text = securityService.currentUser?.email
       }
    
    func setup() {
        tableView.register(MovieTableViewCell.NIB, forCellReuseIdentifier: MovieTableViewCell.IDENTIFIER)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    @IBAction func logout(_ sender: Any) {
        
        securityService.logout()
        delegate?.didTouchLogout()
    }
    

        
        
    }
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.IDENTIFIER) as! MovieTableViewCell
        
        if let movies = controller?.movies[indexPath.row] {
            cell.configure(movie: movies)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         controller?.showDetails(index: indexPath)
     }
}

extension HomeViewController: MoviesViewModelViewDelegate {
    func didUpdateMoviesList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    
    }
    
    
    func didCompleteWithError(_ message: String) {
        
    }
}

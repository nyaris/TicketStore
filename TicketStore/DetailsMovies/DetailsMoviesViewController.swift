//
//  DetailsMoviesViewController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsMoviesViewController: UIViewController {
    @IBOutlet weak var textSinopse: UITextView!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelYearMovie: UILabel!
    @IBOutlet weak var labelNameMovie: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    private var downloadTask: DownloadTask?
    
    var viewModel: DetailsMoviesViewModel?
    
    init(viewModel: DetailsMoviesViewModel?, nibName:String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
           super.init(coder: coder)
       }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      setup()
        
      downloadTask?.cancel()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonReturn(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    
    func setup() {
        textSinopse.text = viewModel?.movie.plot
        let year = viewModel?.movie.yearOfCreation
        labelYearMovie.text = String(year!)
        
        if let url = URL(string: (viewModel?.movie.photo)!) {
            self.imageView.kf.indicatorType = .activity
            self.downloadTask = self.imageView.kf.setImage(with: url) { (result) in
                self.downloadTask = nil
            }
        } else {
            downloadTask = nil
            imageView.image = nil
        }
        
        
        
        labelNameMovie.text = viewModel?.movie.title
        labelGender.text = viewModel?.movie.category
       }
    
    }

   



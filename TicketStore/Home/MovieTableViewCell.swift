//
//  MovieTableViewCell.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    static let IDENTIFIER = "MovieTableViewCell"
    static let NIB = UINib(nibName: "MovieTableViewCell", bundle: nil)
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    private var downloadTask: DownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = selectedBackgroundView
        // Initialization code
    }
    
    override func prepareForReuse() {
        downloadTask?.cancel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(movie: Movies) {
        self.label.text = movie.title
        if let url = URL(string: movie.photo) {
            self.movieImageView.kf.indicatorType = .activity
            self.downloadTask = self.movieImageView.kf.setImage(with: url) { (result) in
                self.downloadTask = nil
            }
        } else {
            downloadTask = nil
            movieImageView.image = nil
        }
        
    }
    
}

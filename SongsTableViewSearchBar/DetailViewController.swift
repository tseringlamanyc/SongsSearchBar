//
//  DetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Tsering Lama on 11/27/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    var song: Song!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songLabel.text = song.name
        artistLabel.text = song.artist
    }
    

}

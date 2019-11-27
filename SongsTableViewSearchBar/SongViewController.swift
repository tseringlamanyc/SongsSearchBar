//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SongViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var songs = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        songs = Song.loveSongs
    }

}

extension SongViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let aSong = songs[indexPath.row]
        cell.textLabel?.text = aSong.name
        cell.detailTextLabel?.text = aSong.artist
        return cell
    }
}


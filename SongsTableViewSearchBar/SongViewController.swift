//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

enum SearchScope: CaseIterable {
    case title
    case artist
}

class SongViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var songSearch: UISearchBar!
    
    var currentScope = SearchScope.title
    var currentSearch = "" {
        didSet {
            switch currentScope {
            case .title:
                songs = Song.loveSongs.filter { $0.name.lowercased().contains(currentSearch.lowercased())}
            case .artist:
                songs = Song.loveSongs.filter { $0.artist.lowercased().contains(currentSearch.lowercased())}
            }
        }
    }
    
    
    var songs = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        songSearch.delegate = self
        songs = Song.loveSongs
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexpath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailVC.song = songs[indexpath.row]
    }

}

extension SongViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if songs.count == 0 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
            label.textAlignment = .center
            view.addSubview(label)
            label.text = "No Song"
            tableView.backgroundView = label
        }
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

extension SongViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            songs = Song.loveSongs
            return
        }
        currentSearch = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            currentScope = .title
        case 1:
            currentScope = .artist
        default:
            break
        }
    }
    
}


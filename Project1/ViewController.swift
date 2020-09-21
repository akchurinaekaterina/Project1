//
//  ViewController.swift
//  Project1
//
//  Created by Ekaterina Akchurina on 16.09.2020.
//  Copyright © 2020 Ekaterina Akchurina. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    var sortedPictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(recoomend))
        // Do any additional setup after loading the view.
        
        //creates a data type that allows to work with file system
        let fm = FileManager.default
        //resource path of our bundle
        let path = Bundle.main.resourcePath!
        //add all the filenames in bundle to the items array
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        sortedPictures = pictures.sorted()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedPictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = sortedPictures[indexPath.row]
        cell.imageView?.image = UIImage(named: sortedPictures[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            dc.imageName = sortedPictures[indexPath.row]
            dc.totalNumber = sortedPictures.count
            dc.currentNumber = indexPath.row + 1
            navigationController?.pushViewController(dc, animated: true)
            
        }
        
    }
    
    @objc func recoomend(){
        let text = "Hey! I really like this app, check it out! Here is the link"
        let recommend = UIActivityViewController(activityItems: [text], applicationActivities: [])
        present(recommend, animated: true, completion: nil)
    }
    


}


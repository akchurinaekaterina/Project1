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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
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
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.imageView?.image = UIImage(named: pictures[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            dc.imageName = pictures[indexPath.row]
            navigationController?.pushViewController(dc, animated: true)
            
        }
        
    }


}


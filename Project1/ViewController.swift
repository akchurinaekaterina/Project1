//
//  ViewController.swift
//  Project1
//
//  Created by Ekaterina Akchurina on 16.09.2020.
//  Copyright © 2020 Ekaterina Akchurina. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedPictures.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? ImageCell else {fatalError()}
        cell.imageView.image = UIImage(named: sortedPictures[indexPath.item])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let dc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            dc.imageName = sortedPictures[indexPath.item]
            dc.totalNumber = sortedPictures.count
            dc.currentNumber = indexPath.item + 1
            navigationController?.pushViewController(dc, animated: true)
            
        }
    }
 
    
    @objc func recoomend(){
        let text = "Hey! I really like this app, check it out! Here is the link"
        let recommend = UIActivityViewController(activityItems: [text], applicationActivities: [])
        present(recommend, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width: 100.0, height: 100.0)
        }
    
    
    


}


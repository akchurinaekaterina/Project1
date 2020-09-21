//
//  DetailViewController.swift
//  Project1
//
//  Created by Ekaterina Akchurina on 16.09.2020.
//  Copyright © 2020 Ekaterina Akchurina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageName: String?
    var totalNumber: Int?
    var currentNumber: Int?

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = imageName, let totalNumber = totalNumber, let currentNumber = currentNumber {
            title = "Picture \(currentNumber) of \(totalNumber)"
            navigationItem.largeTitleDisplayMode = .never
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
            imageView.image = UIImage(named: imageName)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print ("no image found")
            return }
        guard let imageName = imageName else {return}
        //activity view controller - iOS method of sharing content with other apps and services.
        let activityVC = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityVC, animated: true, completion: nil)
        
    }


}

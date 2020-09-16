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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

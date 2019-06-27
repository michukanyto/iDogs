//
//  DetailViewController.swift
//  iDogs
//
//  Created by Marlon Escobar on 2019-06-27.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var lifeSpan: Int! = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogInfo.text = String(lifeSpan!)

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var dogInfo: UILabel!
    

}

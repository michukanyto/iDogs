//
//  StatsViewController.swift
//  iDogs
//
//  Created by Marlon Escobar on 2019-06-27.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var poodleTextView: UILabel!
    @IBOutlet weak var germanShepherdTextField: UILabel!
    @IBOutlet weak var goldenRetrieverTextField: UILabel!
    @IBOutlet weak var dachshundTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let poodlesCount = userInteractionDao?.getAllDogs(withBreed: "Poodle")
        print(poodlesCount as Any)
        let germanShepherd = userInteractionDao?.getAllDogs(withBreed: "German Shepherd")
        print(germanShepherd as Any)
        let goldenRetriever = userInteractionDao?.getAllDogs(withBreed: "Golden Retriever")
        print(goldenRetriever as Any)
        let dachshund = userInteractionDao?.getAllDogs(withBreed: "Dachshund")
        print(dachshund as Any)
        
        poodleTextView.text = String(poodlesCount!)
        germanShepherdTextField.text = String(germanShepherd!)
        goldenRetrieverTextField.text = String(goldenRetriever!)
        dachshundTextField.text = String(dachshund!)
        
    }
    
}

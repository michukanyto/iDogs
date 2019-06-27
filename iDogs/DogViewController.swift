//
//  DogViewController.swift
//  iDogs
//
//  Created by Marlon Escobar on 2019-06-27.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class DogViewController: UITableViewController {
    var dogs = [Dog]()
    override func viewDidLoad() {
        super.viewDidLoad()
        dogs.append(Dog(breed: "Poodle", lifeSpan: 15))
        dogs.append(Dog(breed: "German Shepherd", lifeSpan: 13))
        dogs.append(Dog(breed: "Golden Retriever", lifeSpan: 12))
        dogs.append(Dog(breed: "Dachshund", lifeSpan: 16))

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let dog = tableView.dequeueReusableCell(withIdentifier: "DogCell") {
            dog.textLabel!.text = String(dogs[indexPath.row].breed)
            return dog
        } else {
            return UITableViewCell()
        }

}

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as? DetailViewController {
            viewController.lifeSpan = dogs[indexPath.row].lifeSpan
            splitViewController?.showDetailViewController(viewController, sender: nil)
            _ = userInteractionDao?.saveDog(withDog: dogs[indexPath.row].breed)
            print("\(dogs[indexPath.row].breed ?? "nothing") has been saved")
        }
    }

}

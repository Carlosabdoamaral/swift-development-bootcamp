//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Carlos Amaral on 09/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBAction func askButton(_ sender: Any) {
        let nth : Int = Int.random(in: 1...5)
        self.image.image = UIImage(named: "ball\(nth)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

